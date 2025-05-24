<template>
  <div class="game-room-item">
    <div class="popup text pointerdiv" @click="joinRoom">
      <span :class="statusClass">{{ room.status === 1 ? '游戏中' : '等待中' }}</span>
      <span>人数：{{ room.currentPlayers }}/{{ room.maxPlayers }}</span>
      <span>({{ ownerName }} 的房间)</span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { Room } from '@/interface';
import { getUserNameById } from '@/request';
import { defineProps, computed } from 'vue'

const props = defineProps<{
  room: Room
}>()

const ownerName = ref('');

const getOwnerName = async () => {
  const data = await getUserNameById(props.room.ownerId);
  ownerName.value = data.data;
};

// 监听props.room.ownerId变化，请求getUserNameById(props.room.ownerId)赋值给ownerName
const stop = watch(() => props.room.ownerId, getOwnerName);

const emit = defineEmits(['join']);

const statusClass = computed(() => {
  return props.room.status === 1 ? 'firetext' : 'greentext'
});

const joinRoom = () => {
  emit('join', props.room.roomId)
};

onMounted(() => {
  getOwnerName();
});
onUnmounted(() => {
  stop();
});
</script>

<style scoped>

.popup > * {
  margin-right: 20px;
}

.popup:first-child {
  margin-left: 20px;
}

.game-room-item {
  margin-bottom: 5px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background: rgba(0, 0, 0, 0.2);
}

.popup.text.pointerdiv {
  display: inline-block;
  white-space: nowrap;
  width: calc(100% - 10px);
  cursor: pointer;
}

.firetext {
  color: red;
}

.greentext {
  color: green;
}
</style>