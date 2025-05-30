<template>
  <div :class="['player-slot', position]">
    <img :src="photoSrc" alt="Avatar" class="avatar" />
    <div class="nickName">{{ player.nickName }}</div>
    <!-- <span class="player-score">{{ 0 }}</span> -->
    <span class="remaining-cards">{{ cards.length }} 张</span>
    <!-- 玩家手牌 -->
    <HandCards
      v-show="position === 'bottom'"
      :cards="cards"
      :cardSize="150"
      class="bottom-cards"
    ></HandCards>
    <!-- 出牌区域 -->
    <HandCards
      :cards="playedCards"
      :cardSize="100"
      class="played-cards"
    ></HandCards>
  </div>
</template>

<script lang="ts" setup>
import { defineProps, ref, watch, onUnmounted } from "vue";
import { Card, User } from "@/interface";

const props = defineProps<{
  player: User;
  cards: Card[];
  playedCards: Card[];
  position: string;
}>();

const photoSrc = ref(props.player.avatar);

const stop = watch(
  () => props.player.avatar,
  (newPhoto) => {
    if (!newPhoto) {
      // if (props.player.sex === 0) {
      //   photoSrc.value = "male.png";
      // } else {
      //   photoSrc.value = "female.png";
      // }
      photoSrc.value = "http://localhost:82/static/img/profile.473f5971.jpg";
    } else {
      photoSrc.value = newPhoto;
    }
  },
  { immediate: true }
);

onUnmounted(() => {
  stop();
});
</script>

<style scoped>
.player-slot {
  --image-width: 100px;
  width: var(--image-width);
}

.player-slot {
  text-align: center;
  position: absolute;
}

.avatar {
  width: var(--image-width);
  height: var(--image-width);
  border-radius: 50%;
}

.player-slot.bottom > .avatar {
  position: absolute;
  left: 5%;
}

.nickName {
  /* font-size: 16px; */
  position: absolute;
  color: white;
  top: 0;
  left: 50%;
  transform: translateX(-50%);
  padding: 2px 5px;
}

.player-slot.bottom > .nickName {
  left: calc(5% + var(--image-width) / 2);
}

.cards {
  display: flex;
  gap: 10px;
}

.player-slot.top {
  top: 10%;
  left: calc(50% - var(--image-width) / 2);
  /* transform: translateX(-50%); */
}

.player-slot.left {
  top: calc(50% - var(--image-width) / 2);
  left: 10%;
  /* transform: translateY(-50%) rotate(-90deg); */
}

.player-slot.right {
  top: calc(50% - var(--image-width) / 2);
  right: 10%;
  /* transform: translateY(-50%) rotate(90deg); */
}

.player-slot.bottom {
  width: 100%;
  height: 25vh;
  top: 75vh;
}

.player-score {
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  padding: 2px 5px;
  border-radius: 5px;
}

.remaining-cards {
  margin-top: 5px;
  color: rgb(184, 200, 177);
  padding: 5px 10px; /* 添加内边距 */
  border: 2px solid rgb(181, 194, 206); /* 添加边框 */
  background-color: rgba(52, 124, 145); /* 半透明背景 */
  border-radius: 5px; /* 圆角边框 */
}

.player-slot.bottom > .remaining-cards {
  position: absolute;
  left: 7%;
  top: var(--image-width);
}

.bottom-cards {
  position: absolute;
  left: calc(10% + 100px);
  width: calc(70% - 100px);
  height: 100%;
}

.played-cards {
  pointer-events: none;
  position: absolute;
  width: 100%;
  height: 100%;
  margin: 0;
}

.player-slot.bottom > .played-cards {
  top: -200px;
  left: calc(10% + 130px);
  width: calc(70% - 100px);
}

.player-slot.left > .played-cards {
  left: calc(100% + 20px);
  top: 0px;
}

.player-slot.top > .played-cards {
  left: 0px;
  top: calc(100% + 20px);
}

.player-slot.right > .played-cards {
  left: calc(-100% - 20px);
  top: 0px;
}
</style>
