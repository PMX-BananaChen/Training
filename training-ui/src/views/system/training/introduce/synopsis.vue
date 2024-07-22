<template>
  <div style="background: white">
    <el-container>
      <el-form :model="form" :rules="rules" ref="form" label-width="80px" style="margin: 0 auto; width: 100%">
        <el-main style="padding-top: 5px">
          <el-form-item label="简介标题" prop="title">
            <el-col :span="5">
              <el-input v-model="form.title" style="width: 87%"></el-input>
            </el-col>
          </el-form-item>
          <el-form-item label="作者" prop="author">
            <el-col :span="5">
              <el-input v-model="form.author" style="width: 87%"></el-input>
            </el-col>
          </el-form-item>

          <el-form-item prop="imageName" label="封面上传" required>
            <div class="coverImg-upload" @click="showCoverImgCropper = true">
              <img v-if="form.imageName" :src="form.imageName" class="coverImg" />
              <i v-else class="el-icon-plus coverImg-upload-icon" />
            </div>
          </el-form-item>
          <img-upload-cropper :visible.sync="showCoverImgCropper" @upload-success="onCoverImgUploaded" />

          <el-form-item label="简介内容" prop="content">
            <el-input v-model="form.content" type="textarea" placeholder="请输入内容" />
          </el-form-item>
        </el-main>

        <el-form-item style="text-align: center">
          <el-button type="primary" @click="onSubmit">提交</el-button>
          <el-button plain @click="returnPage">返回</el-button>
        </el-form-item>
      </el-form>
    </el-container>
  </div>
</template>
  
<script>
import {
  getSynopsis,
  addSynopsis,
  updateSynopsis
} from "@/api/system/training/synopsis";
import ImgUploadCropper from "@/components/ImgUploadCropper";
export default {
  props: {
    uploadData: Object,
  },
  components: {
    ImgUploadCropper,
  },
  mounted() {
    let data = this.uploadData;
    if (data.page === "edit") {
      this.form.type = String(data);
    } else {
    }
  },
  data() {
    return {
      form: {
        title: "",
        author: "",
        content: "",
        imageName: "",
        type: "",
        imageSrc: "",
        remark: ""
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        type: null,
      },
      showCoverImgCropper: false,
      rules: {
        author: [{ required: true, message: "请填写作者", trigger: "blur" }],
        title: [
          { required: true, message: "请输培训介绍封面标题", trigger: "blur" },
        ]
      },
    };
  },
  created() {
    this.queryParams.type = this.uploadData.data;
    getSynopsis(this.queryParams).then((response) => {
      if (response.code === 200 && null!=response.data) {
        this.form = response.data;
      }
    });
  },
  methods: {
    onSubmit() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          let form = this.form
          //查询数据库中存在type条件数据则修改,不存在则新增
          if (this.queryParams.type == form.type) {
            updateSynopsis(JSON.stringify(form)).then((response) => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.$emit("close", false);
              }
            });
          } else {
            form.type= this.queryParams.type;
            addSynopsis(JSON.stringify(form)).then((response) => {
              if (response.code === 200) {
                this.msgSuccess("上传成功");
                this.$emit("close", false);
              }
            });
          }
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    returnPage() {
      this.$emit("close", false);
    },
    /**
     * 上传封面图片回显
     */
    onCoverImgUploaded(imgSrc) {
      this.form.imageName = imgSrc;
    },
  },
};
</script>
<style lang="scss">
.coverImg-upload {
  margin-top: 10px;
  width: 150px;
  height: 150px;
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;

  img {
    width: 100%;
    height: 100%;
  }

  .coverImg-upload-icon {
    font-size: 28px;
    color: #8c939d;
    width: 150px;
    height: 150px;
    line-height: 150px;
    text-align: center;
  }
}
</style>
  
  