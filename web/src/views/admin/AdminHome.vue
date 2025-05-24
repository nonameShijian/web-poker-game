<template>
  <el-container style="height: 100vh" class="background">
    <!-- Header -->
    <el-header>
      <div
        style="
          display: flex;
          justify-content: space-between;
          align-items: center;
        "
      >
        <h2>欢迎, {{ username }}</h2>
        <el-dropdown v-if="userStore.currentUser">
          <!-- <el-icon style="font-size: 30px"><CirclePlus /></el-icon> -->
          <OnlineUserItem :user="userStore.currentUser!"></OnlineUserItem>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </el-header>

    <!-- Main Content -->
    <el-main>
      <el-tabs type="border-card" style="min-height: 80vh; opacity: 0.95">
        <!-- 用户管理 -->
        <el-tab-pane label="用户管理">
          <div>
            <!-- 用户管理表格 -->
            <el-table :data="users" style="width: 100%">
              <el-table-column
                prop="userId"
                label="ID"
                width="180"
              ></el-table-column>
              <el-table-column
                prop="username"
                label="用户名"
                width="180"
              ></el-table-column>
              <el-table-column prop="email" label="邮箱"></el-table-column>
              <el-table-column label="权限">
                <template #default="scope">
                  <el-switch
                    v-model="scope.row.role"
                    :active-value="1"
                    :inactive-value="0"
                    active-text="管理员"
                    inactive-text="用户"
                    :disabled="true"
                  />
                </template>
              </el-table-column>
              <el-table-column label="状态">
                <template #default="scope">
                  <el-switch
                    v-model="scope.row.status"
                    :active-value="1"
                    :inactive-value="0"
                    active-text="正常"
                    inactive-text="禁用"
                    :disabled="true"
                  />
                </template>
              </el-table-column>
              <el-table-column label="操作">
                <template #default="scope">
                  <el-button @click="UserEdit(scope.$index, scope.row)"
                    >编辑</el-button
                  >
                  <el-button
                    type="danger"
                    @click="UserDelete(scope.$index, scope.row)"
                    >删除</el-button
                  >
                </template>
              </el-table-column>
            </el-table>
          </div>

          <!-- 添加/编辑用户的对话框 -->
          <el-dialog v-model="dialogFormVisible" title="用户信息">
            <el-form :model="userForm" :rules="userRules" ref="userFormRef">
              <el-form-item
                label="用户名"
                prop="username"
                :label-width="formLabelWidth"
              >
                <el-input
                  v-model="userForm.username"
                  autocomplete="off"
                ></el-input>
              </el-form-item>
              <el-form-item
                label="性别"
                prop="sex"
                :label-width="formLabelWidth"
              >
                <el-radio-group v-model="userForm.sex">
                  <el-radio :value="0">男</el-radio>
                  <el-radio :value="1">女</el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item
                label="邮箱"
                prop="email"
                :label-width="formLabelWidth"
              >
                <el-input
                  v-model="userForm.email"
                  autocomplete="off"
                ></el-input>
              </el-form-item>
              <el-form-item
                label="权限"
                prop="role"
                :label-width="formLabelWidth"
              >
                <el-switch
                  v-model="userForm.role"
                  :active-value="1"
                  :inactive-value="0"
                  active-text="管理员"
                  inactive-text="用户"
                  :disabled="userStore.currentUser?.userId === userForm.userId"
                />
              </el-form-item>
              <el-form-item
                label="状态"
                prop="status"
                :label-width="formLabelWidth"
              >
                <el-switch
                  v-model="userForm.status"
                  :active-value="1"
                  :inactive-value="0"
                  active-text="正常"
                  inactive-text="禁用"
                  :disabled="userStore.currentUser?.userId === userForm.userId"
                />
              </el-form-item>
            </el-form>
            <template #footer>
              <span class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取消</el-button>
                <el-button type="primary" @click="UserSubmitForm"
                  >确认</el-button
                >
              </span>
            </template>
          </el-dialog>
        </el-tab-pane>

        <!-- 其他管理部分暂时留空 -->
        <el-tab-pane label="用户游戏胜负统计管理">
          <div>待实现...</div>
        </el-tab-pane>
        <el-tab-pane label="游戏房间管理">
          <div>待实现...</div>
        </el-tab-pane>
        <el-tab-pane label="历史比赛结果管理">
          <div>待实现...</div>
        </el-tab-pane>
        <el-tab-pane label="聊天记录管理">
          <div>待实现...</div>
        </el-tab-pane>
      </el-tabs>
    </el-main>
  </el-container>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted, computed } from "vue";
import {
  deleteUser,
  getAllUsers,
  getUserInfoByToken,
  refreshToken,
  updateUser,
} from "@/request";
import { User } from "@/interface";
import { ElMessage, FormInstance, FormRules } from "element-plus";

import { useUserStore } from "@/store/userStore";
import router from "@/router";
import {
  EMAIL_REGEX,
  EMAIL_TIP,
  USERNAME_REGEX,
  USERNAME_TIP,
} from "@/utils/validators";
import { confirmDelete } from "@/utils/confirm";
const userStore = useUserStore();

// 用户名
const username = computed(() => userStore.currentUser?.username);

// 用户列表数据
const users = ref<User[]>([]);

// 表单数据
const userForm = reactive<User>({
  userId: 0,
  username: "",
  sex: 0,
  email: "",
  role: 0,
  status: 1,
} as unknown as User);

// 验证规则
const userRules = reactive<FormRules>({
  username: [
    { required: true, message: "请输入用户名", trigger: "blur" },
    {
      validator: (_rule: any, value: any, callback: any) => {
        if (!USERNAME_REGEX.test(value)) {
          callback(new Error(USERNAME_TIP));
        } else {
          callback();
        }
      },
      trigger: "blur",
    },
  ],
  email: [
    { required: true, message: "请输入邮箱", trigger: "blur" },
    {
      validator: (_rule: any, value: any, callback: any) => {
        if (!EMAIL_REGEX.test(value)) {
          callback(new Error(EMAIL_TIP));
        } else {
          callback();
        }
      },
      trigger: "blur",
    },
  ],
});

// 表单验证引用
const userFormRef = ref<FormInstance>();

const dialogFormVisible = ref(false);
const formLabelWidth = "140px";

// 获取用户数据
const fetchUsers = async () => {
  getAllUsers()
    .then((data) => {
      users.value = data.data;
    })
    .catch((e) => {
      console.log(e);
      ElMessage.error("获取用户列表失败！");
    });
};

// 处理编辑
const UserEdit = (_index: number, row: User) => {
  userForm.userId = row.userId;
  userForm.username = row.username;
  userForm.sex = row.sex;
  userForm.email = row.email;
  userForm.role = row.role;
  userForm.status = row.status;
  dialogFormVisible.value = true;
};

// 处理删除
const UserDelete = async (_index: number, row: User) => {
  confirmDelete(row.userId).then(async (confirmed) => {
    if (confirmed) {
      await deleteUser(row.userId)
        .then(async () => {
          ElMessage.success("删除用户信息成功");
          await fetchUsers();
        })
        .catch((e) => {
          ElMessage.error("删除用户信息失败");
          console.log(e);
        });
    }
  });
};

// 提交表单
const UserSubmitForm = async () => {
  userFormRef.value!.validate((valid) => {
    if (userForm.userId !== 0 && valid) {
      // 更新用户
      updateUser(userForm)
        .then(async () => {
          ElMessage.success("更新用户信息成功");
          dialogFormVisible.value = false;
          await fetchUsers();
        })
        .catch((e) => {
          ElMessage.error("更新用户信息失败");
          console.log(e);
        });
    }
  });
};

// 登出
const logout = () => {
  userStore.clearUser();
  router.push("/auth");
};

// 封装获取用户信息的方法
const fetchUserInfo = async () => {
  const data = await getUserInfoByToken();
  if (data.code !== 200) {
    throw new Error(data.msg);
  }
  userStore.setUser(data.data);
};

onMounted(async () => {
  if (!userStore.currentUser) {
    try {
      await fetchUserInfo();
    } catch (error) {
      ElMessage.error("登录状态异常，正在尝试刷新令牌...");
      try {
        await refreshToken(); // 刷新 Token
        await fetchUserInfo(); // 刷新 Token 后再次获取用户信息
      } catch (refreshError) {
        ElMessage.error("登录已过期，请重新登录");
        router.push("/auth");
      }
    }
  }
  fetchUsers();
});
</script>

<style scoped>
.background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: url("/admin.png") no-repeat center center;
  background-size: cover; /* 关键：强制覆盖整个容器 */
  background-attachment: fixed; /* 可选：固定背景防止滚动 */
}
</style>
