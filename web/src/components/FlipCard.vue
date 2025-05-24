<template>
  <div class="flip-card-container">
    <div class="card" :class="{ flipped: isFlipped }">
      <div class="front face">
        <slot name="front"></slot>
      </div>
      <div class="back face">
        <slot name="back"></slot>
      </div>
    </div>
    <!-- PokerJS 动画容器 -->
    <div ref="pokerContainer" class="poker-canvas"></div>
  </div>
</template>

<script lang="ts" setup>
import { ref, onBeforeUnmount, nextTick, watch } from 'vue';
// import Poker from '@/utils/poker.ts';

const props = defineProps({
  isFlipped: {
    type: Boolean,
    required: true
  }
});

// const isFlipped = ref(false);
const pokerContainer = ref<HTMLDivElement>();
const animationFrame = ref<number>();

const toggleFlip = () => {
  nextTick(() => {
    if (pokerContainer.value) {
      const canvas = document.createElement('canvas');
      canvas.width = 300;
      canvas.height = 400;
      pokerContainer.value.appendChild(canvas);
      const ctx = canvas.getContext('2d')!;

      const centerX = canvas.width / 2;
      const centerY = canvas.height / 2;
      const cards: any[] = [];

      // 生成20张卡片
      for (let i = 0; i < 20; i++) {
        const size = 60 + Math.random() * 40;
        const angle = Math.random() * Math.PI * 2;
        const speed = Math.random() * 5 + 1;
        const suit = ['h', 'd', 's', 'c'][Math.floor(Math.random() * 4)];
        const point = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K'][Math.floor(Math.random() * 13)];
        cards.push({
          x: centerX,
          y: centerY,
          size,
          angle,
          speed,
          suit,
          point
        });
      }

      animateFly(ctx, cards);
    }
  });
};

const animateFly = (ctx: CanvasRenderingContext2D, cards: any[]) => {
  const frames = 60;
  let frame = 0;
  const animate = () => {
    if (frame >= frames) {
      clearCanvas();
      return;
    }
    ctx.clearRect(0, 0, 300, 400);
    ctx.save();

    cards.forEach((card) => {
      const dx = card.speed * frame * Math.cos(card.angle);
      const dy = card.speed * frame * Math.sin(card.angle);
      const currentX = card.x + dx;
      const currentY = card.y + dy;

      const currentSize = card.size * (1 - frame / frames);
      ctx.globalAlpha = 1 - frame / frames;
      const rotation = (frame * 0.1) * Math.PI;

      ctx.translate(currentX, currentY);
      ctx.rotate(rotation);
      ctx.drawPokerCard(0, 0, currentSize, card.suit, card.point);
      ctx.setTransform(1, 0, 0, 1, 0, 0);
    });

    ctx.restore();
    frame++;
    animationFrame.value = requestAnimationFrame(animate);
  };
  animate();
};

const clearCanvas = () => {
  if (pokerContainer.value) {
    pokerContainer.value.innerHTML = '';
  }
};

const stop = watch(
  () => props.isFlipped,
  () => {
    toggleFlip();
  }
);

// 组件卸载时清理动画
onBeforeUnmount(() => {
  stop();
  if (animationFrame.value) {
    cancelAnimationFrame(animationFrame.value);
  }
  clearCanvas();
});
</script>

<style scoped>
.flip-card-container {
  position: relative;
  /* cursor: pointer; */
}

.card {
  width: 300px;
  height: 400px;
  transition: transform 0.6s;
  transform-style: preserve-3d;
}

.flipped {
  transform: rotateY(180deg);
}

.face {
  position: absolute;
  width: 100%;
  height: 100%;
  backface-visibility: hidden;
  border-radius: 16px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.front {
  background: #fff;
}

.back {
  background: #fff;
  transform: rotateY(180deg);
  /* display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center; */
}

.poker-canvas {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 1;
}
</style>