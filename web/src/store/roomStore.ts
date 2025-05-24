import { ref } from 'vue'
import { defineStore } from 'pinia'
import { Room } from '@/interface'

export const useRoomStore = defineStore('room', () => {
  const currentRoom = ref<Room | null>(null)

  function setRoom(room: Room) {
    currentRoom.value = room
  }

  function clearRoom() {
    currentRoom.value = null
  }

  function updateRoomInfo(payload: Partial<Room>) {
    if (currentRoom.value) {
      currentRoom.value = { ...currentRoom.value, ...payload }
    }
  }

  return {
    currentRoom,
    setRoom,
    clearRoom,
    updateRoomInfo,
  }
})