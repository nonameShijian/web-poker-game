<template>
  <div class="hand-cards">
    <PokerCard
      v-for="(card, index) in cards"
      :key="index"
      :suit="card.suit"
      :point="card.point"
      :size="cardSize"
      :style="{ left: `calc(50% - (${allWidth}px / 2) + ${index * (cardSize * scale)}px)` }"
      class="card"
    ></PokerCard>
  </div>
</template>

<script lang="ts" setup>
import { defineProps, computed } from 'vue';
import PokerCard from './PokerCard.vue';
import { Card } from '@/interface';

const props = defineProps<{
  cards: Card[];
  cardSize?: number;
}>();

const scale = ref(0.25);

const cardSize = computed(() => props.cardSize || 100);
const cardWidth = computed(() => cardSize.value * 0.75);

// props.cards.length张牌，props.cards.length - 1张牌是只有25%宽度的
const allWidth = computed(() => {
    return cardWidth.value * scale.value * (props.cards.length - 1) +
    cardWidth.value
});

</script>

<style scoped>
.hand-cards {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.card {
  cursor: pointer;
  position: absolute;  /* 每张牌绝对定位 */
  transition: transform 0.3s;  /* 添加过渡效果，使移动更平滑 */
}
</style>