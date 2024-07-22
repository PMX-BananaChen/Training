<template>
  <div style="background: white">
    <el-container>
      <el-form :model="form"
               :rules="rules"
               ref="form"
               label-width="80px"
               style="margin: 0 auto; width: 100%">
        <el-main style="padding-top: 5px">
          <el-form-item label="文章标题"
                        prop="title">
            <el-col :span="5">
              <el-input v-model="form.title"
                        style="width: 87%"></el-input>
            </el-col>
          </el-form-item>
          <el-form-item label="作者"
                        prop="author">
            <el-col :span="5">
              <el-input v-model="form.author"
                        style="width: 87%"></el-input>
            </el-col>
          </el-form-item>
          <el-form-item label="文章类型"
                        prop="type">
            <el-select v-model="form.type"
                       placeholder="请选择文章类型">
              <el-option v-for="dict in typeList"
                         :key="dict.dictValue"
                         :label="dict.dictLabel"
                         :value="dict.dictValue"></el-option>
            </el-select>
          </el-form-item>
          
          <el-form-item prop="imageName" label="封面上传" required>
            <div class="coverImg-upload" @click="showCoverImgCropper = true">
              <img
                v-if="form.imageName"
                :src="form.imageName"
                class="coverImg"
              />
              <i v-else class="el-icon-plus coverImg-upload-icon" />
            </div>
          </el-form-item>
          <img-upload-cropper
            :visible.sync="showCoverImgCropper"
            @upload-success="onCoverImgUploaded"
          />

          <el-form-item label="文章链接"
                        prop="articleUrl">
            <el-col :span="5">
              <el-input v-model="form.articleUrl"
                        style="width: 300%"></el-input>
            </el-col>
          </el-form-item>

          <el-form-item label="文章内容">
            <div id="wangeditor">
              <div ref="editorElem"></div>
            </div>
          </el-form-item>
          <el-form-item label="备注">
            <el-input v-model="form.remark"></el-input>
          </el-form-item>
        </el-main>

        <el-form-item style="text-align: center">
          <el-button type="primary"
                     @click="onSubmit">提交</el-button>
          <el-button plain
                     @click="returnPage">返回</el-button>
        </el-form-item>
      </el-form>
    </el-container>
  </div>
</template>

<script>
import E from 'wangeditor'
import { uploadPeriodical, addPeriodical, updatePeriodical } from '@/api/system/training/periodical'
import ImgUploadCropper from "@/components/ImgUploadCropper";
export default {
  props: {
    uploadData: Object
  },
  components: {
    ImgUploadCropper,
  },
  mounted() {
    this.editor = new E(this.$refs.editorElem) //获取组件并构造编辑器
    let data = this.uploadData
    if (data.page === 'edit') {
      this.form = data.data
      // this.form.layoutDate = [this.form.layoutYear, this.form.layoutDate]
      this.form.type = String(this.form.type)
      this.setWangEdit(
        this.form.content.replace(/&lt;/g, '<').replace(/&gt;/g, '>')
      )
    } else {
      this.wangEdit()
    }
  },
  data() {
    return {
      editor: null,
      form: {
        type: '',
        remark: '',
        author: '',
        title: '',
        layoutDate:'',
        imageName: "",
        articleUrl:"",
        layoutYear: '',
        imageNameList: [],
        content: '' //存储富文本编辑器的内容
      },
      showCoverImgCropper: false,
      typeList: [],
      rules: {
        // author: [{ required: true, message: '请填写作者', trigger: 'blur' }],
        title: [
          { required: true, message: '请输入培训文章标题', trigger: 'blur' }
        ],
        type: [
          { required: true, message: '请选择文章', trigger: 'blur' }
        ],
        // layoutDate: [{ required: true, message: '请选择期刊', trigger: 'blur' }]
      }
    }
  },
  created() {
    this.getDicts('sys_periodical_type').then((response) => {
      this.typeList = response.data
    })
  },
  methods: {
    setWangEdit(content) {
      this.wangEdit()
      this.editor.txt.html(content)
    },
    wangEdit() {
      let editor = this.editor
      editor.config.onchange = (html) => {
        this.form.content = html //动态获取富文本编辑器的内容
      }
      editor.config.onchangeTimeout = 500 // 修改为 500ms

      editor.config.onblur = function (newHtml) {
        // console.log("onblur", newHtml); // 获取最新的 html 内容
      }
      editor.config.onfocus = function (newHtml) {
        // console.log("onfocus", newHtml); // 获取最新的 html 内容
      }

      // 隐藏“网络图片”tab
      editor.config.showLinkImg = false
      // 关闭粘贴内容中的样式
      editor.config.pasteFilterStyle = false
      // 忽略粘贴内容中的图片
      editor.config.pasteIgnoreImg = false
      // 将图片大小限制为 10M
      editor.config.uploadImgMaxSize = 10 * 1024 * 1024
      // 限制一次最多上传 3 张图片
      editor.config.uploadImgMaxLength = 10

      editor.config.zIndex = 1

      editor.config.uploadImgAccept = [
        'jpg',
        'jpeg',
        'png',
        'gif',
        'bmp',
        'webp'
      ]

      editor.config.uploadFileName = 'file[]'
      editor.config.placeholder = '请填写培训文章内容'
      // 后端上传接口
      // editor.config.uploadImgServer = "/upload-img";
      // base64存储
      editor.config.uploadImgShowBase64 = true
      // 配置菜单栏，设置不需要的菜单
      editor.config.excludeMenus = ['emoticon', 'video']

      editor.config.debug = true // 开启debug模式

      editor.config.uploadImgHeaders = {
        Authorization: localStorage.getItem('toutoken') // 设置请求头
      }

      //自己定义上传的方法
      editor.config.customUploadImg = (resultFiles, insertImgFn) => {
        // resultFiles 是 input 中选中的文件列表
        // insertImgFn 是获取图片 url 后，插入到编辑器的方法
        // 创建 FormData 对象来处理数据：键值对的形式，键可以重复
        let formData = new FormData()
        for (let i = 0; i < resultFiles.length; i++) {
          //将表单中的数据取出来，添加到file中
          formData.append('file', resultFiles[i])
        }

        this.form.imageNameList = []

        uploadPeriodical(formData).then((res) => {
          for (let j = 0; j < res.data.length; j++) {
            // 上传图片，返回结果，将图片插入到编辑器中
            editor.cmd.do(
              'insertHTML',
              `<img src="${res.data[j].imgSrc}" width="100%" class="imgSrc"/>`
            )
            this.form.imageNameList.push(res.data[j].fileName)
          }
        })
      }
      editor.create()
    },
    getLayoutDate() {
      let arr = []
      let children = []
      for (let j = 1; j <= 12; j++) {
        children.push({
          value: j,
          label: '第' + j + '期'
        })
      }
      for (let i = 2010; i <= 2050; i++) {
        arr.push({
          value: i,
          label: i + '年',
          children
        })
      }
      return arr
    },
    onSubmit() {
      this.$refs.form.validate((valid) => {
        if (valid) {
          // this.form.layoutYear = this.form.layoutDate[0]
          // this.form.layoutDate = this.form.layoutDate[1]
          this.form.layoutNo = 1

          let form = this.form
          let content = form.content.replace(/</g, '&lt;').replace(/>/g, '&gt;')
          form.content = content

          if (this.uploadData.page === 'edit') {
            if (!this.form.imageNameList) {
              this.form.imageNameList = []
            }
            updatePeriodical(JSON.stringify(form)).then((response) => {
              if (response.code === 200) {
                this.msgSuccess('修改成功')
                this.$emit('close', false)
              }
            })
          } else {
            addPeriodical(JSON.stringify(form)).then((response) => {
              if (response.code === 200) {
                this.msgSuccess('上传成功')
                this.$emit('close', false)
              }
            })
          }
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    returnPage() {
      this.$emit('close', false)
    },
    /**
     * 上传封面图片回显
     */
    onCoverImgUploaded(imgSrc) {
      this.form.imageName = imgSrc;
    },
  }
}
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

