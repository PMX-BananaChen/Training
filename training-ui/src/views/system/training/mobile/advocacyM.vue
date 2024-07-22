<template>
  <div class="introduceM">
    <h2 style="font-weight: bolder; text-indent: 12.4px">{{form.title}}</h2>
    <h3 style="text-indent: 32.4px; margin: 0">{{form.author}}</h3>
    <p style="text-indent: 32.4px">
      {{form.content}}
    </p>
    <van-image
      width="100%"
      height="150px"
      :src="form.imageName"
    />
    <van-tabs v-model:active="active" @click="getList()" animated>
      <van-tab
        v-for="(dict, index) in typeList"
        :key="index"
        :title="dict.dictLabel"
      >
        <van-row
          v-for="(item, index) in advocacys"
          :key="index"
          style="background-color: #fff"
          id="rowId"
        >
          <van-divider :style="{ padding: '0 8px', margin: '6px 0' }" />
          <div @click="gotPage(advocacys[index])">
            <van-row>
              <van-col span="10">
                <div>
                  <img :src="item.imageSrc" />
                </div>
              </van-col>
              <van-col span="14" class="van-multi-ellipsis--l2">
                <span class="vtitle">
                  {{ item.title }}
                </span>
              </van-col>
              <span class="vauthor">
                {{ item.author }}
              </span>
            </van-row>
          </div>
        </van-row>
      </van-tab>
    </van-tabs>
    <van-empty description="暂无资料" v-if="this.advocacys == ''" />
  </div>
</template>
  
  <script type="text/babel">
import Vue from "vue";
import {
  Tab,
  Tabs,
  NavBar,
  Divider,
  Col,
  Row,
  Image as VanImage,
  List,
  Empty,
} from "vant";
Vue.use(Tab)
  .use(Tabs)
  .use(NavBar)
  .use(Divider)
  .use(Col)
  .use(Row)
  .use(VanImage)
  .use(List)
  .use(Empty);

import { getAdvocacyMobile } from "@/api/system/training/advocacy";
import {
  getSynopsis
} from "@/api/system/training/synopsis";
import wx from 'weixin-js-sdk'
export default {
  components: {},
  data() {
    return {
      active: 0,
      typeList: [],
      advocacys: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        type: null,
      },
      form: {
        title: "",
        author: "",
        content: "",
        imageName: "",
        type: "",
        imageSrc: "",
        remark: ""
      },
    };
  },
  created() {
    if (null != this.$route.params.type) {
      this.active = this.$route.params.type;
    }
    this.getDicts("sys_advocacy_type").then((response) => {
      this.typeList = response.data;
    });
    this.getList();
    this.getDetail();
    //调用js-sdk签名
    this.getgetTicketSign();
    //隐藏功能按钮
    this.hideOptionMenu();
  },
  methods: {
    getList() {
      getAdvocacyMobile(this.active).then((response) => {
        this.advocacys = response.data;
      });
    },
    getDetail() {
      this.queryParams.type = 'advocacy';
      getSynopsis(this.queryParams).then((response) => {
      if (response.code === 200) {
        this.form = response.data;
      }
    });
    },
    gotPage(data) {
      if (!data.articleUrl) {
        this.$router.push({
          name: "advocacyDetail",
          params: { list: data },
        });
      } else {
        window.open(data.articleUrl, "_blank");
      }
    },
    typeFormat(row, column) {
      return this.selectDictLabel(this.typeList, row.type);
    },
    getgetTicketSign() {
      let url = encodeURIComponent(location.href.split("#")[0]);
      // 通过code获取 openId等用户信息
      this.$axios
      //企业微信创建训练与发展图标name=????
        .get("/training-api/OAuth2/getTicketSign?name=url=" + url)
        .then((res) => {
          let datas = res.data;
          if (datas.code === 1) {
            wx.config({
              debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来
              appId: "ww24261f29f0d4837c", // 必填，公众号的唯一标识
              timestamp: datas.data.timestamp, // 必填，生成签名的时间戳
              nonceStr: datas.data.nonceStr, // 必填，生成签名的随机串
              signature: datas.data.signature, // 必填，签名，见附录1
              jsApiList: ["hideOptionMenu"], // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });
            wx.ready(() => {
              console.log("微信js-sdk 配置成功");
            });
            wx.error(function (res) {
              console.log("微信js-sdk配置失败");
            });
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    hideOptionMenu(){
      wx.hideOptionMenu();
    }
  },
};
</script>
  <style >
.introduceM {
  background-color: #f7f8fa;
  margin: 0 auto;
  width: 96%;
}
.van-doc-demo-block__title {
  margin: 0;
  padding: 4px 16px 16px;
  color: rgba(69, 90, 100, 0.6);
  font-weight: bolder;
  font-size: 15px;
  line-height: 16px;
}
#rowId .vauthor {
  
  font-size: 0.8rem;
  color: #999999;
  float: right;
  margin: 1rem;
  max-width: 10rem;
}

#rowId .vtitle {
  
  font-size: 1rem;
  color: black;
}
#rowId img {
  height: 15vh;
  margin: 2%;
  width: 90%;
}
</style>