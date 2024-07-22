<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showqueryParams"
      label-width="100px"
    >
      <el-form-item label="文件标题" prop="fileName">
        <el-input
          v-model="queryParams.fileName"
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
          v-hasPermi="['system:pdfFile:add']"
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
          v-hasPermi="['system:pdfFile:remove']"
          >删除</el-button
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
      :data="IntroduceList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column
        label="文件标题"
        align="center"
        prop="fileName"
        show-overflow-tooltip
      />
      <el-table-column label="文件路径"  align="center" prop="fileUrl" show-overflow-tooltip/>
      
      <el-table-column
        label="创建时间"
        align="center"
        prop="createTime"
        
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
            v-hasPermi="['system:pdfFile:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:pdfFile:remove']"
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

    <!-- 添加或修改培训pdf文件对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="1200px"
      append-to-body
      @close="close"
    >
      <PDFUpload
        v-if="open"
        :uploadData="uploadData"
        @close="close"
      />
    </el-dialog>

  </div>
</template>

<script>
import {
  listPDFFile,
  addPDFFile,
  updatePDFFile,
  delPDFFile,
  uploadPDFFile
} from "@/api/system/training/uploadFile";
import PDFUpload from "../uploadFile/pdfUpload";

export default {
  components: {
    PDFUpload,
  },
  name: "uploadFile",
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
      // 培训pdf文件表格数据
      IntroduceList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        fileName: null,
        fileUrl: null,
        createTime: null,
        createBy: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        beginTime: null,
        endTime: null,
      },
      sertchTime: {
        createTime: null,
      },
      typeList: [],
      // 培训pdf文件上传数据
      uploadData: {},
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        id: [{ required: true, message: "主键ID不能为空", trigger: "blur" }],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询培训pdf文件列表 */
    getList() {
      this.loading = true;
      this.queryParams.beginTime = this.sertchTime.createTime
        ? this.sertchTime.createTime[0]
        : null;
      this.queryParams.endTime = this.sertchTime.createTime
        ? this.sertchTime.createTime[1]
        : null;
      listPDFFile(this.queryParams).then((response) => {
        this.IntroduceList = response.rows;
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
        fileName: null,
        fileUrl: null,
        updateTime: null,
        createBy: null,
        updateBy: null,
        createTime: null,
        remark: null,
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
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.uploadData = { page: "add" };
      this.title = "培训文件上传";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.open = true;
      this.uploadData = { page: "edit", data: row };
      this.title = "培训文件修改";
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != null) {
            updatePDFFile(this.form).then((response) => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              }
            });
          } else {
            addPDFFile(this.form).then((response) => {
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
    /** 删除按钮操作 */
    handleDelete(row) {
      const Ids = row.id || this.ids;
      this.$confirm("此操作将永久删除该文件, 是否继续?", "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(function () {
          return delPDFFile(Ids);
        })
        .then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
        .catch(function () {});
    },
    typeFormat(row, column) {
      return this.selectDictLabel(this.typeList, row.type);
    },
    /** 上传回调 */
    close(isRef) {
      this.open = false;
      this.handleQuery();
    },
  },
};
</script>

