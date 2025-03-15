<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="信息id" prop="id">
        <el-input
          v-model="queryParams.id"
          placeholder="请输入信息id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="比赛id" prop="raceId">
        <el-input
          v-model="queryParams.raceId"
          placeholder="请输入比赛id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="玩家A" prop="playerA">
        <el-input
          v-model="queryParams.playerA"
          placeholder="请输入玩家A"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="玩家B" prop="playerB">
        <el-input
          v-model="queryParams.playerB"
          placeholder="请输入玩家B"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="玩家C" prop="playerC">
        <el-input
          v-model="queryParams.playerC"
          placeholder="请输入玩家C"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="玩家D" prop="playerD">
        <el-input
          v-model="queryParams.playerD"
          placeholder="请输入玩家D"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="胜者A" prop="winnerA">
        <el-input
          v-model="queryParams.winnerA"
          placeholder="请输入胜者A"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="胜者B" prop="winnerB">
        <el-input
          v-model="queryParams.winnerB"
          placeholder="请输入胜者B"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['raceInfoAdmin:raceInfoAdmin:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['raceInfoAdmin:raceInfoAdmin:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['raceInfoAdmin:raceInfoAdmin:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['raceInfoAdmin:raceInfoAdmin:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="raceInfoAdminList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="信息id" align="center" prop="id" />
      <el-table-column label="比赛id" align="center" prop="raceId" />
      <el-table-column label="玩家A" align="center" prop="playerA" />
      <el-table-column label="玩家B" align="center" prop="playerB" />
      <el-table-column label="玩家C" align="center" prop="playerC" />
      <el-table-column label="玩家D" align="center" prop="playerD" />
      <el-table-column label="胜者A" align="center" prop="winnerA" />
      <el-table-column label="胜者B" align="center" prop="winnerB" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['raceInfoAdmin:raceInfoAdmin:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['raceInfoAdmin:raceInfoAdmin:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改历史比赛信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="比赛id" prop="raceId">
          <el-input v-model="form.raceId" placeholder="请输入比赛id" />
        </el-form-item>
        <el-form-item label="玩家A" prop="playerA">
          <el-input v-model="form.playerA" placeholder="请输入玩家A" />
        </el-form-item>
        <el-form-item label="玩家B" prop="playerB">
          <el-input v-model="form.playerB" placeholder="请输入玩家B" />
        </el-form-item>
        <el-form-item label="玩家C" prop="playerC">
          <el-input v-model="form.playerC" placeholder="请输入玩家C" />
        </el-form-item>
        <el-form-item label="玩家D" prop="playerD">
          <el-input v-model="form.playerD" placeholder="请输入玩家D" />
        </el-form-item>
        <el-form-item label="胜者A" prop="winnerA">
          <el-input v-model="form.winnerA" placeholder="请输入胜者A" />
        </el-form-item>
        <el-form-item label="胜者B" prop="winnerB">
          <el-input v-model="form.winnerB" placeholder="请输入胜者B" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listRaceInfoAdmin, getRaceInfoAdmin, delRaceInfoAdmin, addRaceInfoAdmin, updateRaceInfoAdmin } from "@/api/raceInfo/raceInfoAdmin/raceInfoAdmin";

export default {
  name: "RaceInfoAdmin",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 历史比赛信息表格数据
      raceInfoAdminList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id: null,
        raceId: null,
        playerA: null,
        playerB: null,
        playerC: null,
        playerD: null,
        winnerA: null,
        winnerB: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询历史比赛信息列表 */
    getList() {
      this.loading = true;
      listRaceInfoAdmin(this.queryParams).then(response => {
        this.raceInfoAdminList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        raceId: null,
        playerA: null,
        playerB: null,
        playerC: null,
        playerD: null,
        winnerA: null,
        winnerB: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加历史比赛信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getRaceInfoAdmin(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改历史比赛信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateRaceInfoAdmin(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRaceInfoAdmin(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除历史比赛信息编号为"' + ids + '"的数据项？').then(function() {
        return delRaceInfoAdmin(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('raceInfoAdmin/raceInfoAdmin/export', {
        ...this.queryParams
      }, `raceInfoAdmin_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
