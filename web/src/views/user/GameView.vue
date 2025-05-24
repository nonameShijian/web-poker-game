<template>
  <div class="game-container">
    <div class="background"></div>

    <!-- 顶部玩家 -->
    <PlayerSlot
      v-if="topPlayer"
      :player="topPlayer"
      position="top"
    ></PlayerSlot>

    <!-- 左侧玩家 -->
    <PlayerSlot
      v-if="leftPlayer"
      :player="leftPlayer"
      position="left"
    ></PlayerSlot>

    <!-- 右侧玩家 -->
    <PlayerSlot
      v-if="rightPlayer"
      :player="rightPlayer"
      position="right"
    ></PlayerSlot>

    <!-- 底部玩家（自己） -->
    <PlayerSlot
      v-if="bottomPlayer"
      :player="bottomPlayer"
      position="bottom"
    ></PlayerSlot>

    <!-- 玩家手牌 -->
    <HandCards
      v-if="bottomPlayer"
      :cards="cards"
      :cardSize="150"
      class="bottom-cards"
    ></HandCards>
  </div>
</template>

<script lang="ts" setup>
import { computed } from "vue";
import PlayerSlot from "@/components/PlayerSlot.vue";
import { useUserStore } from "@/store/userStore";
import { storeToRefs } from "pinia";
import { useRoomStore } from "@/store/roomStore";
import { Card } from "@/interface";

const userStore = useUserStore();
const { currentUser } = storeToRefs(userStore);

const roomStore = useRoomStore();
const { currentRoom } = storeToRefs(roomStore);

const cards = ref<Card[]>([
  {
    suit: "hearts",
    point: 1,
  },
  {
    suit: "hearts",
    point: 2,
  },
  {
    suit: "hearts",
    point: 5,
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
  background: url("/background.png") no-repeat center center;
  background-size: cover; /* 关键：强制覆盖整个容器 */
  background-attachment: fixed; /* 可选：固定背景防止滚动 */
}

.bottom-cards {
  position: absolute;
  left: calc(10% + 100px);
  top: 75%;
  width: calc(70% - 100px);
  height: calc(25% - 35px);
}
</style>
