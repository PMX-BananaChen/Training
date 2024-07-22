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
          v-for="(item, index) in periodicals"
          :key="index"
          style="background-color: #fff"
          id="rowId"
        >
          <van-divider :style="{ padding: '0 8px', margin: '6px 0' }" />
          <div @click="gotPage(periodicals[index])">
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
    <van-empty description="暂无资料" v-if="this.periodicals == ''" />
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

import { getPeriodicalMobile } from "@/api/system/training/periodical";
import {
  getSynopsis
} from "@/api/system/training/synopsis";
export default {
  components: {},
  data() {
    return {
      active: 0,
      typeList: [],
      periodicals: [],
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
    this.getDicts("sys_periodical_type").then((response) => {
      this.typeList = response.data;
    });
    this.getList();
    this.getDetail();
  },
  methods: {
    getList() {
      getPeriodicalMobile(this.active).then((response) => {
        this.periodicals = response.data;
      });
    },
    getDetail() {
      this.queryParams.type = 'periodical';
      getSynopsis(this.queryParams).then((response) => {
      if (response.code === 200) {
        this.form = response.data;
      }
    });
    },
    gotPage(data) {
      if (!data.articleUrl) {
        this.$router.push({
          name: "periodicalDetail",
          params: { list: data },
        });
      }else{
        window.open(data.articleUrl,"_blank");
      }
    },
    typeFormat(row, column) {
      return this.selectDictLabel(this.typeList, row.type);
    },
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