<template>
  <div class="game-container">
    <div class="background"></div>

    <!-- 双方升级点数 -->
    <div class="upgrade-points">
      <div class="upgrade-points-title">升级点数<br />已进行了10轮游戏</div>
      <div class="player-upgrade">
        <span>A队：</span>
        <PokerCard suit="hearts" :point="1"></PokerCard>
      </div>
      <div class="opponent-upgrade">
        <span>B队：</span>
        <PokerCard suit="hearts" :point="12"></PokerCard>
      </div>
    </div>

    <!-- 顶部玩家 -->
    <PlayerSlot
      v-if="topPlayer"
      :player="topPlayer"
      :cards="[]"
      :playedCards="[{ suit: 'diamonds', point: 4 }]"
      position="top"
    ></PlayerSlot>

    <!-- 左侧玩家 -->
    <PlayerSlot
      v-if="leftPlayer"
      :player="leftPlayer"
      :cards="cards.slice(0, 1)"
      :playedCards="[{ suit: 'hearts', point: 6 }]"
      position="left"
    ></PlayerSlot>

    <!-- 右侧玩家 -->
    <PlayerSlot
      v-if="rightPlayer"
      :player="rightPlayer"
      :cards="cards.slice(0, 4)"
      :playedCards="[{ suit: 'clubs', point: 12 }]"
      position="right"
    ></PlayerSlot>

    <!-- 底部玩家（自己） -->
    <PlayerSlot
      v-if="bottomPlayer"
      :player="bottomPlayer"
      :cards="[]"
      :playedCards="[{ suit: 'hearts', point: 14 }]"
      position="bottom"
    ></PlayerSlot>

    <!-- 出牌按钮区域 -->
    <div class="action-buttons" v-if="bottomPlayer && false">
      <button @click="pass">不出</button>
      <button @click="hint">提示</button>
      <button @click="playCard">出牌</button>
    </div>

    <!-- 结算对话框 -->
    <el-dialog title="游戏结算" v-model="over" width="50%" center>
      <div class="settlement-content">
        <h3>游戏结果</h3>
        <p>A队总得分：{{ 14 }}</p>
        <p>B队总得分：{{ 12 }}</p>
        <p>胜者：{{ bottomPlayer.nickName }} 和 {{ topPlayer.nickName }}</p>
      </div>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="closeDialog">确认</el-button>
      </span>
    </el-dialog>

  </div>
</template>

<script lang="ts" setup>
import { computed } from "vue";
import PlayerSlot from "@/components/PlayerSlot.vue";
import { useUserStore } from "@/store/userStore";
import { storeToRefs } from "pinia";
import { useRoomStore } from "@/store/roomStore";
import { Card } from "@/interface";
import router from "@/router";

const userStore = useUserStore();
const { currentUser } = storeToRefs(userStore);

const roomStore = useRoomStore();
const { currentRoom } = storeToRefs(roomStore);

const cards = ref<Card[]>([
  {
    suit: "diamonds",
    point: 5,
  },
  {
    suit: "diamonds",
    point: 7,
  },
  {
    suit: "spades",
    point: 1,
  },
  {
    suit: "clubs",
    point: 2,
  },
  {
    suit: "hearts",
    point: 3,
  },
  {
    suit: "hearts",
    point: 15,
  },
]);

/**
 * 获取按顺时针排列的玩家列表，以自己为起点
 */
const getPlayersInClockwiseOrder = () => {
  if (!currentRoom.value || !currentUser.value) return [];

  const players = [...currentRoom.value.players]; // 克隆原数组避免修改原始数据
  const selfIndex = players.findIndex(
    (p) => p.userId === currentUser.value?.userId
  );

  if (selfIndex === -1) return [];

  // 按顺时针排序：把自己放到第一个，之后是后面的人，最后是前面的人
  const clockwisePlayers = [
    ...players.slice(selfIndex),
    ...players.slice(0, selfIndex),
  ];

  return clockwisePlayers;
};

/**
 * 获取下一个玩家
 */
const getNextPlayer = () => {
  const orderedPlayers = getPlayersInClockwiseOrder();
  const currentIndex = orderedPlayers.findIndex(
    (p) => p.userId === currentUser.value?.userId
  );
  const nextIndex = (currentIndex + 1) % orderedPlayers.length;
  return orderedPlayers[nextIndex];
};

// 确定每个玩家的位置
const topPlayer = computed(() => {
  const players = getPlayersInClockwiseOrder();
  return players[2] || null;
});

const leftPlayer = computed(() => {
  const players = getPlayersInClockwiseOrder();
  return players[1] || null;
});

const rightPlayer = computed(() => {
  const players = getPlayersInClockwiseOrder();
  return players[3] || null;
});

const bottomPlayer = computed(() => {
  const players = getPlayersInClockwiseOrder();
  return players[0] || null;
});

const pass = () => {
  // 处理不出逻辑
};

const hint = () => {
  // 处理提示逻辑
};

const playCard = () => {
  // 处理出牌逻辑
};

const over = ref(true);
const closeDialog = () => {
  over.value = false;
  router.push('/user');
};
</script>

<style scoped>
.game-container {
  width: 100vw;
  height: 100vh;
  overflow: hidden;

  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
}

.background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: url("/background.jpg") no-repeat center center;
  background-size: cover; /* 关键：强制覆盖整个容器 */
  background-attachment: fixed; /* 可选：固定背景防止滚动 */
}

.upgrade-points {
  position: absolute;
  top: 10px;
  left: 10px;
  background-color: rgba(255, 255, 255, 0.8);
  padding: 10px;
  border-radius: 5px;
}

/* 单独设置标题样式 */
.upgrade-points-title {
  text-align: center;
  font-weight: bold;
  margin-bottom: 8px; /* 和下面内容有一点间距 */
}

/* 使用一个容器包裹两个队伍信息，并启用 flex 布局 */
.upgrade-points > .player-upgrade,
.upgrade-points > .opponent-upgrade {
  display: flex;
  align-items: center;
  gap: 5px;
  margin-bottom: 5px; /* 可选：两行之间有间隔 */
}

.action-buttons {
  position: absolute;
  top: calc(75vh - 50px);
  height: 50px;
  display: flex;
  gap: 10px;
  margin-top: 10px;
}

.action-buttons button {
  padding: 10px 20px;
  font-size: 16px;
}
</style>
