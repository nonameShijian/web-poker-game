<template>
  <div class="online-user-item">
    <img :src="photoSrc" alt="User Photo" class="user-photo" />
    <span>{{ user.username }}</span>
  </div>
</template>

<script setup lang="ts">
import { User } from "@/interface";
import { defineProps } from "vue";

const props = defineProps<{
  user: User;
}>();

const photoSrc = ref(props.user.photo);
const stop = watch(
  () => props.user.photo,
  (newPhoto) => {
    if (!newPhoto) {
      if (props.user.sex === 0) {
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
.online-user-item {
  border: 1px solid black;
  border-radius: 5px;
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}

.user-photo {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  margin-right: 8px;
}
</style>
