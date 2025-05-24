<template>
  <div class="auth-container">
    <!-- 背景 -->
    <div class="background"></div>

    <!-- 翻转卡片 -->
    <FlipCard :isFlipped="isFlipped" class="card-container">
      <template #front>
        <div class="form-content">
          <h2>登录</h2>
          <el-form
            ref="loginFormRef"
            :model="loginForm"
            :rules="loginRules"
            label-position="left"
          >
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="loginForm.email" />
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-input v-model="loginForm.password" type="password" />
            </el-form-item>
            <el-button type="primary" @click="handleLogin">登录</el-button>
          </el-form>
          <div class="toggle-link" @click="toggleForm">没有账号？注册</div>
        </div>
      </template>

      <template #back>
        <div class="form-content">
          <h2>注册</h2>
          <el-form
            ref="registerFormRef"
            :model="registerForm"
            :rules="registerRules"
            label-position="left"
          >
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="registerForm.email" />
            </el-form-item>
            <el-form-item label="用户名" prop="username">
              <el-input v-model="registerForm.username" />
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-input v-model="registerForm.password" type="password" />
            </el-form-item>
            <el-button type="primary" @click="handleRegister">注册</el-button>
          </el-form>
          <div class="toggle-link" @click="toggleForm">已有账号？登录</div>
        </div>
      </template>
    </FlipCard>
  </div>
</template>

<script lang="ts" setup>
import { reactive, ref } from "vue";
import FlipCard from "@/components/FlipCard.vue";
import { ElMessage, FormInstance, FormRules } from "element-plus";
import { EMAIL_REGEX, EMAIL_TIP, PASSWORD_REGEX, PASSWORD_TIP, USERNAME_REGEX, USERNAME_TIP } from "@/utils/validators";
import { getUserInfoByToken, loginUser, registerUser } from "@/request"
import { User } from "@/interface";
import router from "@/router";

import { useUserStore } from '@/store/userStore'
import { initWebSocket } from "@/utils/websocket";
import configs from "@/configs";
const userStore = useUserStore()

// 表单数据
const loginForm = ref({
  // email: "2954700422@qq.com",
  // password: "Ss123456",
   email: "shijian2954700422@gmail.com",
  password: "SSSzzz123",
});
const registerForm = ref({
  email: "shijian2954700422@gmail.com",
  password: "SSSzzz123",
  username: "测试用户",
});

// 验证规则
const loginRules = reactive<FormRules>({
  email: [
    { required: true, message: "请输入邮箱", trigger: "blur" },
    { validator: (_rule: any, value: any, callback: any) => {
      if (!EMAIL_REGEX.test(value)) {
        callback(new Error(EMAIL_TIP));
      } else {
        callback();
      }
    }, trigger: "blur" },
  ],
  password: [
    { required: true, message: "请输入密码", trigger: "blur" },
    { validator: (_rule: any, value: any, callback: any) => {
      if (!PASSWORD_REGEX.test(value)) {
        callback(new Error(PASSWORD_TIP));
      } else {
        callback();
      }
    }, trigger: "blur" },
  ],
});

const registerRules = reactive<FormRules>({
  ...loginRules,
  username: [
    { required: true, message: "请输入用户名", trigger: "blur" },
    { validator: (_rule: any, value: any, callback: any) => {
      if (!USERNAME_REGEX.test(value)) {
        callback(new Error(USERNAME_TIP));
      } else {
        callback();
      }
    }, trigger: "blur" },
  ],
});

// 表单验证引用
const loginFormRef = ref<FormInstance>();
const registerFormRef = ref<FormInstance>();

// 表单切换逻辑
const isFlipped = ref(false);
const toggleForm = () => {
  isFlipped.value = !isFlipped.value;
  loginFormRef.value!.resetFields();
  registerFormRef.value!.resetFields();
};
// 登录逻辑
const handleLogin = () => {
  loginFormRef.value!.validate((valid) => {
    if (valid) {
      loginUser(loginForm.value as User).then(async data => {

        // 获取用户信息
        await getUserInfoByToken().then(data => {
          console.log(data);
          userStore.setUser(data.data);
        });

        if (data.code === 200) {
          ElMessage.success("登录成功！");
          initWebSocket(`ws://${configs.host}${configs.contextPath}/ws?token=${localStorage.getItem("refreshToken")}`);
          // 判断权限
          if (Number(data.data.role) === 1) {
            router.push("/admin");
          }
          else {
            router.push("/user");
          }
        }
        else {
          ElMessage.error(data.message);
        }
      }).catch((e) => {
        ElMessage.error("登录失败！");
        console.log(e);
      });
    }
  });
};

// 注册逻辑
const handleRegister = () => {
  registerFormRef.value!.validate((valid) => {
    if (valid) {
      registerUser(registerForm.value as User).then((data) => {
        console.log(data);
        if (data.code === 200) {
          ElMessage.success("注册成功！");
          isFlipped.value = false;
        }
        else {
          ElMessage.error(data.message);
        }
      }).catch((e) => {
        ElMessage.error("注册失败！");
        console.log(e);
      });
    }
  });
};
</script>

<style scoped>
.auth-container {
  position: relative;
  width: 100vw;
  height: 100vh;
  overflow: hidden;
}

.background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: url("/login.png") no-repeat center center;
  background-size: cover; /* 关键：强制覆盖整个容器 */
  background-attachment: fixed; /* 可选：固定背景防止滚动 */
}

.flip-card {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.form-content {
  padding: 30px;
  text-align: center;
}

.form-content h2 {
  margin-bottom: 20px;
  color: #333;
}

.el-form {
  width: 100%;
}

.el-button {
  width: 100%;
  margin-top: 20px;
}

.toggle-link {
  margin-top: 15px;
  color: #8b4513;
  cursor: pointer;
  transition: color 0.3s;
}

.toggle-link:hover {
  color: #d2b48c;
}

/* 新增：卡片容器居中 */
.card-container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
