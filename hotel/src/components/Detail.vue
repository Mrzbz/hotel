<template>
  <div class="details">
    <!-- 头 -->
    <Header />
    <!-- 上面轮播图片开始 -->
    <div class="swipe">
      <mt-swipe :auto="3000">
        <mt-swipe-item><img v-lazy="this.imgs.img1" /></mt-swipe-item>
        <mt-swipe-item><img v-lazy="this.imgs.img2" /></mt-swipe-item>
        <mt-swipe-item><img v-lazy="this.imgs.img3" /></mt-swipe-item>
        <mt-swipe-item><img v-lazy="this.imgs.img4" /></mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 上面轮播图片结束 -->

    <!-- 详情开始 -->
    <div>
      <div class="detail">
        <p class="title" v-text="title">title</p>
        <p class="subtitle">
          <span v-text="subtitle">subtitle</span>
          <span class="rType" v-text="rType">rType</span>
        </p>

        <div class="furniture">
          <span>家具:</span>
          床<img src="../assets/icon/chuang.png" /> WiFi<img
            src="../assets/icon/wifi.png"
          />
          洗衣机<img src="../assets/icon/xiyiji.png" /> 空调<img
            src="../assets/icon/kongtiao.png"
          />
        </div>
        <p v-text="`￥${price}`" class="price">price</p>
      </div>
    </div>
    <!-- 详情结束 -->
    <!-- 详情选项开始 -->
    <div>
      <div class="info">
        <mt-field type="date" label="入住日期:" v-model="checkIn"></mt-field>
        <mt-field type="date" label="离店日期" v-model="checkOut"></mt-field>
        <mt-field type="tel" label="联系电话:" v-model="phone"></mt-field>
      </div>
      <div class="detailImg">
        <img v-lazy="this.imgs.img1" />
        <img v-lazy="this.imgs.img2" />
        <img v-lazy="this.imgs.img3" />
        <img v-lazy="this.imgs.img4" />
      </div>
    </div>
    <!-- 详情选项结束 -->
    <!-- 订单按钮 -->
    <div>
      <mt-tabbar fixed>
        <mt-tab-item class="tabbar" id="price">
          <mt-button type="danger" size="large" @click="pay">入住</mt-button>
        </mt-tab-item>
        <!-- <mt-tab-item>
          
        </mt-tab-item> -->
      </mt-tabbar>
    </div>
  </div>
</template>

<script>
import Header from "@/components/Header.vue";

export default {
  components: {
    Header,
  },

  data() {
    return {
      title: "",
      subtitle: "",
      checkIn: "",
      checkOut: "",
      phone: "15646623354",
      payTime:"",
      orderTime:"",
      rType: "",
      price: 0,
      lid: 0,
      results: [],
      imgs: {},
    };
  },
 
  // props:["sendLid"], //接收父组件传来的值
  mounted() {

    this.lid = this.$route.params.lid;
    this.loadPage(this.lid);
  },
  methods: {
    // 加载详情页

    loadPage(lid) {
      this.axios.get("/details/detail?lid=" + lid).then((res) => {
        console.log(res.data.result[0]);
        this.results = res.data.result;
        this.imgs.img1 = require("../assets/image/img1/" +
          this.results[0].img1);
        this.imgs.img2 = require("../assets/image/img2/" +
          this.results[0].img2);
        this.imgs.img3 = require("../assets/image/img3/" +
          this.results[0].img3);
        this.imgs.img4 = require("../assets/image/imgs/" +
          this.results[0].img4);
        this.title = this.results[0].title;
        this.subtitle = this.results[0].subtitle;
        this.price = this.results[0].price;
        this.rType = this.results[0].rType;
      });
    },

    // 下单按钮

    pay() {
     
     
      this.orderTime=new Date().valueOf();
      this.payTime=new Date().valueOf();

      // console.log(this.orderTime,this.payTime)
      // console.log(this.checkOut,this.checkIn,this.phone)
      // 验证手机号码格式
      let phoneRegExp = /^1[3-9][0-9]{9}$/;
      if (this.checkIn >= this.checkOut || this.checkOut=="" || this.checkIn=="") {
        this.$toast({
          message: "请检查入住时间和离店时间",
          position: "bottom",
          duration: "3000",
        });
      } else if (phoneRegExp.test(this.phone)) {
    // 将时间处理成毫秒数
        this.checkIn = new Date(this.checkIn).valueOf();
        this.checkOut = new Date(this.checkOut).valueOf();
        console.log(this.checkOut,this.checkIn,this.phone)
        let obj = {
          checkIn: this.checkIn,
          checkOut: this.checkOut,
          phone: this.phone,
          lid: this.lid,
          payTime:this.payTime,
          orderTime:this.orderTime
          // userId://从本地缓存获取
        };
     
        // this.$router.push("/addorder"); //跳转到订单页面
        // 发送数据到数据库，插入数据
        this.axios
          .post(
            "/add/addOrder",
            this.qs.stringify(obj)
            // "checkIn="+this.checkIn+"&checkOut="+this.checkOut+"&phone="+this.phone+"&lid="+this.lid
          )
          .then((res) => {
            if (res.code == 1) {
              console.log("插入成功");
            }
          });
      } else {
        this.$toast({
          message: "检查手机号码是否正确",
          position: "bottom",
          duration: "3000",
        });
      }
    },
  },
};
</script>

<style>
.details {
  width: 100%;
}
.details .swipe {
  width: 100%;
  height: 240px;
}
.details .swipe img {
  width: 100%;
  height: 240px;
}
.details .detail,
.details .info {
  width: 96%;
  padding: 10px 0;
  margin: 5px auto;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 5px;
}
.details .detail .furniture {
  text-align: left;
  margin-top: 10px;
}
.details .info {
  padding: 0;
}
.details .detail .title {
  font-size: 18px;
  font-weight: bold;
  text-align: left;
  margin: 5px 0;
}
.details .detail .subtitle {
  font-size: 18px;
  /* font-weight: bold; */
  text-align: left;
  margin-top: 10px;
}
.details .detailImg > img {
  width: 320px;
}
.details .detail .price {
  font-size: 24px;
  color: #f00;
  margin-top: 20px;
}

.detailImg {
  width: 320px;
  margin: auto;
}

.details .rType {
  text-align: right;
  font-size: 18px;
  font-weight: bold;
}
</style>