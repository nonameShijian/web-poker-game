<template>
  <div class="background">
    <el-card class="room-card" style="opacity: 0.95">
      <template #header>
        <div>
          <span>{{ inRoom ? "游戏房间" : "房间列表" }}</span>
        </div>
      </template>
      <!-- 游戏房间 -->
      <GameRoom v-if="inRoom" :room="room!" />
      <!-- 房间列表 -->
      <GameRoomItem
        v-else
        v-for="room in rooms"
        :key="room.roomId"
        :room="room"
        @join="joinRoom(room.ownerId)"
      />
      <template #footer>
        <div class="card-footer">
          <el-button v-if="inRoom" @click="leaveRoom(room!.ownerId)"
            >退出房间</el-button
          >
          <el-button
            v-if="inRoom && room!.ownerId  === userStore.currentUser?.userId"
            @click="startGame"
            :disabled="!canStartGame"
            >开始游戏</el-button
          >
          <el-button
            ref="onlineBtnRef"
            v-if="!inRoom"
            @click="toggleOnlineUsers"
            >在线玩家</el-button
          >
          <el-button v-if="!inRoom" @click="createRoom">创建房间</el-button>
        </div>
      </template>
    </el-card>
  </div>
  <transition name="fade">
    <div
      v-if="showOnlineUsers"
      class="online-users-list"
      :style="{ top: userListPosition.top, left: userListPosition.left }"
    >
      <OnlineUserItem
        v-for="user in onlineUsers"
        :key="user.userId + user.username"
        :user="user"
        style="margin: 10px"
      />
    </div>
  </transition>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from "vue";
import { ElMessage } from "element-plus";
import { Room, User } from "@/interface";
import { useUserStore } from "@/store/userStore";
import { getUserInfoByToken } from "@/request";
import router from "@/router";
import config from "@/configs";
import {
  initWebSocket,
  offWebSocketMessage,
  onWebSocketMessage,
  sendWebSocketMessage,
} from "@/utils/websocket";
import { useRoomStore } from "@/store/roomStore";

const userStore = useUserStore();
const roomStore = useRoomStore();

const username = computed(() => userStore.currentUser?.username);
const rooms = ref<Room[]>([]);
const onlineUsers = ref<User[]>([]);
const showOnlineUsers = ref(false);
const onlineBtnRef = ref();
const userListPosition = ref({ top: "0px", left: "0px" }); // 定位信息

const inRoom = ref(false);
const room = ref<Room | null>(null);

// 显示/隐藏在线用户列表
const toggleOnlineUsers = () => {
  if (!onlineBtnRef.value) return;

  const btnEl: HTMLButtonElement = onlineBtnRef.value.$el; // 获取真实 DOM
  const rect = btnEl.getBoundingClientRect();

  const popoverWidth = 150; // .online-users-list 的宽度
  const popoverHeight = 300; // 高度
  const margin = 10; // 边距

  // 获取按钮的 margin-top 和 padding-top
  const style = window.getComputedStyle(btnEl);
  const marginTop = parseFloat(style.marginTop) || 0;
  const paddingTop = parseFloat(style.paddingTop) || 0;

  // ✅ 设置弹出框底部位置为按钮顶部 - 10px
  let top =
    rect.top + window.scrollY - popoverHeight - margin - marginTop - paddingTop;

  // ✅ 水平居中于按钮
  const buttonCenterX = rect.left + rect.width / 2;
  let left = buttonCenterX - popoverWidth / 2;

  // ✅ 限制左侧不能超出屏幕
  if (left < margin) {
    left = margin;
  }

  // ✅ 限制右侧不能超出屏幕
  const maxLeft = window.innerWidth - popoverWidth - margin;
  if (left > maxLeft) {
    left = maxLeft;
  }

  // ✅ 限制顶部不能超出屏幕
  if (top < margin) {
    top = margin;
  }

  // ✅ 更新位置
  userListPosition.value = {
    top: `${top}px`,
    left: `${left}px`,
  };

  showOnlineUsers.value = !showOnlineUsers.value;
};

// 加入房间方法
const joinRoom = (ownerId: number) => {
  sendWebSocketMessage({
    action: "join_room",
    data: { ownerId },
    timestamp: Date.now(),
  }).catch((e) => ElMessage.error(e.message));
};

// 创建房间方法
const createRoom = () => {
  sendWebSocketMessage({
    action: "create_room",
    data: {
      ownerId: userStore.currentUser?.userId,
      maxPlayers: 4,
    },
    timestamp: Date.now(),
  }).catch((e) => ElMessage.error(e.message));;
};

const leaveRoom = (ownerId: number) => {
  sendWebSocketMessage({
    action: "leave_room",
    data: { ownerId },
    timestamp: Date.now(),
  }).catch((e) => ElMessage.error(e.message));;
};

// 是否可以开始游戏（例如：所有玩家都已就绪）
const canStartGame = computed(() => {
  return room.value?.players.length === room.value?.maxPlayers; // 示例条件：至少两个玩家
});

// 开始游戏方法
const startGame = () => {
  if (!canStartGame) {
    ElMessage.error("游戏开始前请确保所有玩家已就绪！");
  }
  sendWebSocketMessage({
    action: "start_game_request",
    data: {
      ownerId: room.value!.ownerId,
    },
    timestamp: Date.now(),
  }).catch((e) => ElMessage.error(e.message));;
};

// 封装获取用户信息的方法
const fetchUserInfo = async () => {
  const data = await getUserInfoByToken();
  if (data.code !== 200) {
    throw new Error(data.msg);
  }
  userStore.setUser(data.user);
};

const WebSocketMessageListener = (event: any) => {
  const data = event.detail;
  console.log("Received message:", data);
  switch (data.action) {
    case "user_list":
      onlineUsers.value = data.data;
      break;
    case "room_list":
      rooms.value = data.data;
      // 如果有自己创建的房间(且该房间内没有自己)，（逻辑上）自动加入房间
      const ownerRoom = rooms.value.find((room: Room) => {
        return (
          room.ownerId === userStore.currentUser?.userId &&
          !room.players.find((player) => {
            return player.userId === userStore.currentUser?.userId;
          })
        );
      });
      if (ownerRoom) {
        joinRoom(ownerRoom.ownerId);
      } else {
        // 如果任意房间内有自己，（UI层面上）加入房间
        // 否则（UI层面上）退出房间
        const hasMeRoom = rooms.value.find((room: Room) => {
          return room.players.find((player) => {
            return player.userId === userStore.currentUser?.userId;
          });
        });
        if (hasMeRoom) {
          if (!inRoom.value) {
            ElMessage.success("正在进入房间");
            inRoom.value = true;
          }
          room.value = hasMeRoom;
        } else if (inRoom.value) {
          ElMessage.success("已退出房间");
          inRoom.value = false;
          room.value = null;
        }
      }
      break;
    case "heart_beat":
      sendWebSocketMessage({
        action: "heart_beat",
        data: {},
        timestamp: Date.now(),
      }).catch((e) => ElMessage.error(e.message));;
      break;
    case "msg_error":
      ElMessage.error(data.message!);
      break;
    case "start_game":
      roomStore.setRoom(room.value!);
      router.push("/game");
      break;
    default:
      console.log("Unknown message action:", data.action);
      break;
  }
};

onMounted(async () => {
  if (!userStore.currentUser) {
    try {
      await fetchUserInfo();
    } catch (error) {
      console.log(error);
      ElMessage.error("登录已过期，请重新登录");
      if (window.top && window.top != window.self) {
        window.top.postMessage({ type: "reload" }, "*");
      }
    }
  }
  initWebSocket(config.baseUrl + "/websocket/game");
  // 页面加载时初始化 WebSocket
  onWebSocketMessage(WebSocketMessageListener);

  // 组件初始化需要拿一次最新数据
  sendWebSocketMessage({
    action: "update_data",
    data: {},
    timestamp: Date.now(),
  }).catch((e) => ElMessage.error(e.message));;

  document.addEventListener("click", handleClickOutside);
  window.addEventListener("resize", handleResize);
});

onUnmounted(() => {
  if (inRoom.value) {
    leaveRoom(room.value!.ownerId);
  }
  // 页面卸载时关闭 WebSocket
  offWebSocketMessage(WebSocketMessageListener);

  document.removeEventListener("click", handleClickOutside);
  window.removeEventListener("resize", handleResize);
});

const handleClickOutside = (event: MouseEvent) => {
  const target = event.target as Node;
  const btnEl = onlineBtnRef.value?.$el;
  const popoverEl = document.querySelector(".online-users-list");

  if (
    showOnlineUsers.value &&
    !popoverEl?.contains(target) &&
    !btnEl?.contains(target)
  ) {
    showOnlineUsers.value = false;
  }
};

const handleResize = () => {
  if (showOnlineUsers.value) {
    toggleOnlineUsers(); // 重新计算位置
  }
};
</script>

<style scoped>
.background {
  display: flex;
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: url("/admin.png") no-repeat center center;
  background-size: cover; /* 关键：强制覆盖整个容器 */
  background-attachment: fixed; /* 可选：固定背景防止滚动 */
}

.room-card {
  width: 70%;
  height: 70%;
  margin: auto;
  display: grid;
  grid-template-rows: 1fr 8fr 1fr;
  min-height: 70vh;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.5s;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.online-users-list {
  width: 150px;
  height: 300px;
  position: absolute;
  background-color: white;
  border: 1px solid #e4e7ed;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  z-index: 9999;
  max-height: 300px;
  overflow-y: auto;
  min-width: 150px;
  padding: 8px 0;
}

.card-footer {
  width: 100%;
  display: flex;
  align-items: center;
  flex-direction: row-reverse; /* 从右向左排列 */
  gap: 10px; /* 子元素之间间距 */
}
</style>
