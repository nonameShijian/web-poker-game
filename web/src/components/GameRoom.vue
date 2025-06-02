<template>
  <div class="game-room">
    <!-- 玩家信息展示 -->
    <div class="player-info">
      <div
        v-for="index in room.maxPlayers"
        :key="room.ownerId + (index - 1)"
        class="player-item"
        :data-position="index - 1"
      >
        <img
          v-if="room.players.at(index - 1)"
          :src="createPhotoSrc(room.players.at(index - 1)!)"
          alt="Player Photo"
          class="player-photo"
        />
        <div v-if="room.players.at(index - 1)" class="player-username">
          {{ room.players.at(index - 1)!.nickName }}
        </div>
        <div v-if="room.players.at(index - 1)">{{ index }}号位</div>
      </div>
    </div>

    <!-- 游戏状态展示 -->
    <!-- <div class="game-status">
      <div class="status-text">
        <span>当前状态: {{ status }}</span>
        <span v-if="timer">倒计时: {{ timer }}</span>
      </div>
    </div> -->
  </div>
</template>

<script setup lang="ts">
import { computed } from "vue";
import { Room, User } from "@/interface";

// 假设这些数据由父组件传递或通过 WebSocket 获取
const props = defineProps<{
  room: Room;
}>();

const status = computed(() => props.room.status);

const createPhotoSrc = (player: User) => {
  if (!player.avatar) {
    // if (player.sex === 0) {
    //   return "male.png";
    // } else {
    //   return "female.png";
    // }
    return `${location.protocol}//${location.hostname}:82/static/img/profile.473f5971.jpg`;
  } else {
    return player.avatar;
  }
};
</script>

<style scoped>
.game-room {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.player-info {
  display: grid;
  grid-template-columns: repeat(2, 1fr); /* 每行两个列，每个列占据相等的空间 */
  gap: 20px; /* 列和行之间的间距 */
  width: 100%;
  justify-items: center;
}

.player-item {
  width: 120px;
  height: 130px;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  text-align: center;
  margin-bottom: 20px;
}

.player-photo {
  width: 100%;
  height: 100%;
}

.player-item {
  position: relative; /* 父元素相对定位 */
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  text-align: center;
}

.player-username {
  color: white;
  position: absolute; /* 子元素绝对定位 */
  top: 5px; /* 距离顶部 5px */
  left: 50%; /* 水平居中 */
  transform: translateX(-50%); /* 水平居中调整 */
  padding: 2px 5px; /* 内边距（可选） */
  border-radius: 3px; /* 圆角（可选） */
}

.game-status {
  margin-bottom: 20px;
  font-size: 1.2em;
  color: #fff;
}
</style>
