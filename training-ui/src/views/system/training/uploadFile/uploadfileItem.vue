<template>
    <div class="file-style-box">
        <div class='upload-file-item'>
            <img :src="imgsrc[getEnd(file.fileName)]" alt="">
            <div>
                <p class='file-name'>
                    <span class='name'>{{ file.fileName }}</span>
                </p>
                <div class='option'>
                    <span class='size'>{{ file.size | toKB }}kb</span>
                    <div>
                        <span v-if='showDel && (isPdf(file) || isImg(file))' @click='previewHandler(file.url)'
                            class='preview mr10'>预览</span>
                        <a v-if='!showDel' @click='downLoadHandler' class='preview' :href="file.url">下载</a>
                        <span v-if='showDel' class='mr10 success'>上传完成</span>
                    </div>
                </div>
                <div class='delBtn' v-if='showDel' @click='cancelHanlder(file)'>
                    <!-- <img src="@/assets/public/tips-err.png" alt=""> -->
                </div>
            </div>
        </div>
        <el-dialog title="图片预览" width="800px" class="imgDlgBox" :visible.sync="imgDlgVisible" :close-on-click-modal="true"
            :modal="false" append-to-body>
            <img :src="imgUrl" alt="">
        </el-dialog>
    </div>
</template>
  
<script>
export default {
    props: {
        file: {
            type: Object,
            default: {}
        },
        showDel: {
            type: Boolean,
            default: false
        }
    },
    data() {
        return {
            imgDlgVisible: false,
            imgUrl: '',
            pdfUrl: '',
            imgsrc: {
                /*
                  *imgsrc 是关于内部静态图片的显示的路径，需要自己设置
                  *示例"xls": require('@/assets/image/xls.png'),
                  xis的文件所需要加载的路径是；assets文件下的image文件夹下的xls.png
              */
                // "rar": require('@'),
                // "zip": require('@'),
                "pdf": require('@/assets/images/login-background.jpg'),
                "jpg": require('@/assets/images/login-background.jpg'),
                // "jpeg": require('@'),
                // "png": require('@'),
                // "doc": require('@'),
                // "docx": require('@'),
                // "txt": require('@'),
                // "xls": require('@/assets/image/xls.png'),
            }
        }
    },
    filters: {
        toKB(val) {
            return (Number(val) / 1024).toFixed(0);
        }
    },
    methods: {
        cancelHanlder(item) {
            this.$emit('cancel', item)
        },
        previewHandler(data) {
            if (data) {
                const addTypeArray = data.split(".");
                const addType = addTypeArray[addTypeArray.length - 1];
                if (addType === "pdf") {
                    let routeData = this.$router.resolve({ path: "/insurancePdf", query: { url: data, showBack: false } });
                    window.open(routeData.href, '_blank');
                } else if (addType === "doc") {
                    window.open(
                        `https://view.officeapps.live.com/op/view.aspx?src=${data}`
                    );
                } else if (addType === "txt") {
                    window.open(`${data}`);
                } else if (['png', 'jpg', 'jpeg'].includes(addType)) { // 图片类型
                    this.imgDlgVisible = true
                    this.imgUrl = data
                }
            }
        },
    }
}  
</script>
<style lang='scss'>
.file-style-box {
    padding: 10px 10px 0 0;
}

.imgDlgBox {
    .el-dialog {
        .el-dialog__body {
            text-align: center;

            img {
                width: 700px;
                height: auto;
            }
        }
    }
}

.upload-file-item {
    background: #FAFAFA;
    border-radius: 4px;
    padding: 5px 10px;
    margin-bottom: 10px;
    display: flex;
    font-size: 14px;
    width: 236px;
    box-sizing: border-box;
    position: relative;

    img {
        width: 32px;
        height: 40px;
        margin-top: 5px;
        margin-right: 10px;
    }

    .option {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .file-name {
        width: 163px;
        display: flex;
        flex-wrap: nowrap;
        font-size: 14px;
        color: #333;
        font-weight: 400;

        .name {
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .end {
            flex: 0 0 auto;
        }

        .el-button {
            border: none;
            padding: 0px;
            width: 90%;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }
    }

    .size {
        color: #969696;
    }

    .success {
        color: #78C06E;
    }

    .delBtn {
        position: absolute;
        top: -14px;
        right: -18px;
        cursor: pointer;

        img {
            width: 16px;
            height: 16px
        }
    }

    // .del {
    //   color: #E1251B;
    //   cursor: pointer;
    // }
    .preview {
        color: #0286DF;
        cursor: pointer;
    }

    .mr10 {
        margin-right: 10px;
    }
}</style>