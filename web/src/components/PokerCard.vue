<template>
  <div class="card-container">
    <canvas ref="canvas" :width="width" :height="height"></canvas>
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from 'vue';

const props = defineProps<{
  suit: 'hearts' | 'diamonds' | 'spades' | 'clubs'; // 花色
  point: 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15; // 点数
  isBack?: boolean; // 是否显示为背面
  size?: number; // 默认大小
}>();

const canvas = ref<HTMLCanvasElement | null>(null);
const size = props.size || 100;
const width = size * 3 / 4;
const height = size;

const pointList = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'O', 'JOKER'];

const drawCard = () => {
  const ctx = canvas.value?.getContext('2d');
  if (!ctx) return;

  ctx.clearRect(0, 0, width, height);

  if (props.isBack) {
    ctx.drawPokerBack(0, 0, size, '#BB5555', '#AA2222');
  } else {
    ctx.drawPokerCard(0, 0, size, props.suit, pointList[props.point - 1]);
  }
};

onMounted(() => {
  drawCard();
});
</script>

<style scoped>
.card-container {
  display: inline-block;
  margin: 5px;
}

canvas {
  image-rendering: pixelated;
}
</style>