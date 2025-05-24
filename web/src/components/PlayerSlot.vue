<template>
  <div :class="['player-slot', position]">
    <img :src="photoSrc" alt="Avatar" class="avatar" />
    <div class="username">{{ player.username }}</div>
  </div>
</template>

<script lang="ts" setup>
import { defineProps, ref, watch, onUnmounted } from "vue";
import { User } from "@/interface";

const props = defineProps<{
  player: User;
  position: string;
}>();

const photoSrc = ref(props.player.photo);

const stop = watch(
  () => props.player.photo,
  (newPhoto) => {
    if (!newPhoto) {
      if (props.player.sex === 0) {
        photoSrc.value = "male.png";
      } else {
        photoSrc.value = "female.png";
      }
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

.username {
  /* font-size: 16px; */
  font-size: 24px;
  font-weight: bold;
  padding: 5px 10px; /* 添加内边距 */
  border: 2px solid #ff5733; /* 添加边框 */
  background-color: rgba(255, 255, 255, 0.8); /* 半透明背景 */
  border-radius: 5px; /* 圆角边框 */
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
  bottom: 10%;
  left: 10%;
  /* transform: translateX(-50%); */
}
</style>
