import { ref } from 'vue'
import { defineStore } from 'pinia'
import { User } from '@/interface'

export const useUserStore = defineStore('user', () => {
  const currentUser = ref<User | null>(null)

  function setUser(user: User) {
    currentUser.value = user
  }

  function clearUser() {
    currentUser.value = null
    localStorage.removeItem('accessToken')
    localStorage.removeItem('refreshToken')
  }

  function updateUserInfo(payload: Partial<User>) {
    if (currentUser.value) {
      currentUser.value = { ...currentUser.value, ...payload }
    }
  }

  return {
    currentUser,
    setUser,
    clearUser,
    updateUserInfo,
  }
})