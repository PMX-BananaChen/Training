<template>
    <div style="background: white">
        <el-container>
            <el-form :model="form" :rules="rules" ref="form" label-width="80px" style="margin: 0 auto; width: 100%">
                <el-main style="padding-top: 5px">
                    <el-form-item label="文件名称" prop="fileName">
                        <el-col :span="5">
                            <el-input v-model="form.fileName" style="width: 87%"></el-input>
                        </el-col>
                    </el-form-item>
                    <el-form-item label="文件路径" prop="fileUrl">
                        <el-input v-model="form.fileUrl" style="width: 87%"></el-input>
                    </el-form-item>


                    <el-form-item label="文件上传" required>
                        <fileUpload :limit="1" @input="input">

                        </fileUpload>
                    </el-form-item>

                    <!-- <el-upload class="upload-demo" ref="uploadCom" :show-fileList="false" :action="uploadUrl"
                        :on-success="onSuccess" :on-remove="handleRemove" :before-upload="beforeUpload" multiple :limit="5"
                        :on-exceed="handleExceed" :fileList="fileList" :accept="accepts">
                        <el-button icon="el-icon-upload2"
                            @click="uploadFileClick($event)">将文件拖到此处，或<em>点击上传</em></el-button>
                        <div slot="tip" class="el-upload__tip">
                            支持扩展名：.rar .zip .doc .docx .xls .txt .pdf .jpg .png .jpeg，最多上传5个文件，每个大小不超过50Mb
                        </div>
                    </el-upload>
                    
                    <div class="flex mt20" v-if="fileList.length > 0">
                        <div class="items-wrap" ref="contentWrap"
                            :style="wrapHeight <= 70 ? 'height: auto' : `height: 60px;`" :class="{ noHidden: noHidden }">
                            <uploadfile-item v-for="(item, index) in fileList" :key="index" :file="item"
                                @cancel="cancelFile" :showDel="true" class="mr20"></uploadfile-item>
                        </div>
                        <div class="on-off" v-if="wrapHeight > 70" @click="noHidden = !noHidden">
                            {{ noHidden ? "收起" : "更多" }}
                        </div>
                    </div> -->

                    <el-form-item label="备注">
                        <el-input v-model="form.remark" style="width: 87%"></el-input>
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
import { listPDFFile, addPDFFile, updatePDFFile, delPDFFile, uploadPDFFile } from '@/api/system/training/uploadFile'
// import UploadfileItem from "../uploadFile/uploadfileItem";
import fileUpload from '@/components/FileUpload/index';
export default {
    props: {
        uploadData: Object
    },
    components: {
        // UploadfileItem,
        fileUpload
    },
    mounted() {
        let data = this.uploadData
        if (data.page === 'edit') {
            this.form = data.data
        }
    },
    data() {
        return {
            noHidden: true,
            wrapHeight: 0,
            delDialogitem: 0,
            imgLoad: false,
            centerDialogVisible: false,
            fileList: [],
            form: {
                fileName: '',
                fileUrl: '',
                remark: '',
            },
            typeList: [],
            rules: {
                fileName: [{ required: true, message: "请填写文件名称", trigger: "blur" }],
                // fileUrl: [{ required: true, message: "请上传文件", trigger: "blur" }],
            }
        }
    },
    created() {
    },
    methods: {

        onSubmit() {
            this.$refs.form.validate((valid) => {
                if (valid) {
                    let form = this.form
                    if (this.uploadData.page === 'edit') {
                        if (!this.form.imageNameList) {
                            this.form.imageNameList = []
                        }
                        updatePDFFile(JSON.stringify(form)).then((response) => {
                            if (response.code === 200) {
                                this.msgSuccess('修改成功')
                                this.$emit('close', false)
                            }
                        })
                    } else {
                        addPDFFile(JSON.stringify(form)).then((response) => {
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
        input(url) {
            this.form.fileUrl = url;
        }
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
  
  