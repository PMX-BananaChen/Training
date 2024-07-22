<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showqueryParams"
      label-width="100px"
    >
      <el-form-item label="课件标题" prop="layoutTitle">
        <el-input
          v-model="queryParams.layoutTitle"
          placeholder="支持模糊查询"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        ></el-input>
      </el-form-item>
      <el-form-item label="课件类型" prop="layoutType">
        <el-select
          v-model="queryParams.layoutType"
          placeholder="请选择课件类型"
          clearable
          size="small"
        >
          <el-option
            v-for="dict in dict.type.cf_label_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item label="课件作者" prop="author">
        <el-input
          v-model="queryParams.author"
          placeholder="支持模糊查询"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        ></el-input>
      </el-form-item>

      <el-row :gutter="20" style="text-align: center">
        <el-col :span="24">
          <el-form-item>
            <el-button
              type="cyan"
              icon="el-icon-search"
              size="mini"
              @click="handleQuery"
              >搜索</el-button
            >
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
              >重置</el-button
            >
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:NEWS:add']"
          >上传</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:NEWS:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="2.5">
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd1"
          v-hasPermi="['system:introduce:add']"
          >设置简介</el-button
        >
      </el-col>
      <div class="top-right-btn">
        <el-tooltip class="item" effect="dark" content="刷新" placement="top">
          <el-button
            size="mini"
            circle
            icon="el-icon-refresh"
            @click="handleQuery"
          />
        </el-tooltip>
        <el-tooltip
          class="item"
          effect="dark"
          :content="showqueryParams ? '隐藏搜索' : '显示搜索'"
          placement="top"
        >
          <el-button
            size="mini"
            circle
            icon="el-icon-view"
            @click="showqueryParams = !showqueryParams"
          />
        </el-tooltip>
      </div>
    </el-row>

    <el-table
      v-loading="loading"
      :data="NEWSList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column
        type="selection"
        width="55"
        align="center"
        show-overflow-tooltip
      />
      <el-table-column
        label="课件标题"
        width="300"
        align="center"
        prop="layoutTitle"
        show-overflow-tooltip
      />
      <el-table-column
        label="课件作者"
        width="200"
        align="center"
        prop="author"
        show-overflow-tooltip
      />
      <el-table-column
        label="课件类型"
        align="center"
        prop="layoutType"
        :formatter="layoutTypeFormat"
        show-overflow-tooltip
      >
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.cf_label_type"
            :value="scope.row.layoutType"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        width="180"
        sortable
        show-overflow-tooltip
      >
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, "{y}-{m}-{d}") }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:NEWS:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-top"
            @click="handleTop(scope.row)"
            >置顶</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:NEWS:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="1200px"
      append-to-body
      @close="close"
    >
      <PickingRichTextUpload
        v-if="open"
        :uploadData="uploadData"
        @close="close"
      />
    </el-dialog>

    <!-- 添加或修改培训介绍简介 -->
    <el-dialog
      :title="title"
      :visible.sync="open1"
      width="1200px"
      append-to-body
      @close="close"
    >
      <synopsis
        v-if="open1"
        :uploadData="uploadData1"
        @close="close"
      />
    </el-dialog>
  </div>
</template>

<script>
import {
  listNEWS,
  delNEWS,
  addNEWS,
  updateNEWS,
  topMPickingNews
} from "@/api/system/training/NEWS";
import PickingRichTextUpload from "../NEWS/PickingRichTextUpload";
import synopsis from "../introduce/synopsis";
export default {
  components: {
    PickingRichTextUpload,
    synopsis
  },
  name: "NEWS",
  dicts: ["cf_label_type"],
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
      showqueryParams: true,
      // 总条数
      total: 0,
      // 表格数据
      NEWSList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //是否显示封面修改弹出层
      open1: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        layoutNo: null,
        layoutTitle: null,
        layoutDate: null,
        author: null,
        createTime: null,
        createBy: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        layoutType: null,
        layoutYear: null,
        content: null,
        contentDate: null,
        imageName: null,
        startDate: null,
        endDate: null,
        beginTime: null,
        endTime: null,
      },
      sertchTime: {
        createTime: null,
      },
      layoutTypeList: [],
      // 领班课件上传数据
      uploadData: {},
      // 简介上传数据
      uploadData1: {},
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        newsId: [
          { required: true, message: "主键ID不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.getDicts("cf_label_type").then((response) => {
      this.layoutTypeList = response.data;
    });
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      this.queryParams.beginTime = this.sertchTime.createTime
        ? this.sertchTime.createTime[0]
        : null;
      this.queryParams.endTime = this.sertchTime.createTime
        ? this.sertchTime.createTime[1]
        : null;
      listNEWS(this.queryParams).then((response) => {
        this.NEWSList = response.rows;
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
        newsId: null,
        layoutNo: null,
        layoutTitle: null,
        layoutDate: null,
        author: null,
        updateTime: null,
        createBy: null,
        updateBy: null,
        createTime: null,
        remark: null,
        layoutType: null,
        layoutYear: null,
        content: null,
        contentDate: null,
        imageName: null,
      };
      this.sertchTime = {
        createTime: null,
      };
      this.resetForm("queryForm");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.reset();
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.newsId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.uploadData = { page: "add" };
      this.title = "领班课件上传";
    },
    /** 简介修改按钮操作 */
    handleAdd1() {
      this.reset();
      this.open1 = true;
      this.uploadData1 = { page: "edit",data:"foreman"};
      this.title = "培训介绍简介设置";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.open = true;
      this.uploadData = { page: "edit", data: row };
      this.title = "领班课件修改";
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.newsId != null) {
            updateNEWS(this.form).then((response) => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addNEWS(this.form).then((response) => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              }
            });
          }
        }
      });
    },
    /** 置顶按钮操作 */
    handleTop(row) {
      this.$confirm("此操作将置顶该文章, 是否继续?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(function () {
          return topMPickingNews(row);
        })
        .then(() => {
          this.getList();
          this.msgSuccess("置顶成功");
        })
        .catch(function () {});
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const newsIds = row.newsId || this.ids;
      this.$confirm("此操作将永久删除该文件, 是否继续?", "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(function () {
          return delNEWS(newsIds);
        })
        .then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
        .catch(function () {});
    },
    layoutTypeFormat(row, column) {
      return this.selectDictLabel(this.layoutTypeList, row.layoutType);
    },
    /** 上传回调 */
    close(isRef) {
      this.open = false;
      this.open1 = false;
      this.handleQuery();
    },
  },
};
</script>

