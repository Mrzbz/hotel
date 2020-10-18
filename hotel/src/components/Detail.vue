<template>
  <div class="detail">
    <!-- 头 -->
    <Header/>
    <!-- 上面轮播图片开始 -->
    <div class="swipe">
      <mt-swipe :auto="3000">
        <mt-swipe-item><img src="../assets/lbt1.png"></mt-swipe-item>
        <mt-swipe-item><img src="../assets/lbt2.png"></mt-swipe-item>
        <mt-swipe-item><img src="../assets/lbt3.png"></mt-swipe-item>
        <mt-swipe-item><img src="../assets/lbt4.png"></mt-swipe-item>
      </mt-swipe>
    </div>
    <!-- 上面轮播图片结束 -->

    <!-- 详情开始 -->
    <div> 
      <div class="detail">
        <p class="title">title</p>
        <p class="subtitle">subtitle</p>  
        <div class="furniture">
          床<img src="../assets/icon/chuang.png">
          WiFi<img src="../assets/icon/wifi.png">
          洗衣机<img src="../assets/icon/xiyiji.png">
          空调<img src="../assets/icon/kongtiao.png">
        </div>
        
      </div>
    </div>
    <!-- 详情结束 -->
    <!-- 详情选项开始 -->
    <div>
      <div class="info">
        <p>入住时间</p>
        <p>搬离时间</p>
        <p>手机号</p>
      </div>
      <img src="../assets/lbt1.png" style="width:300px">
    </div>
    <!-- 详情选项结束 -->
    <!-- 订单按钮 -->
    <div>
      <mt-tabbar fixed>
        <mt-tab-item id="price">
        <span>￥980.00</span>
        </mt-tab-item>
        <mt-tab-item>
          <mt-button type="danger" size="large">入住</mt-button>
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>

<script>
import Header from '@/components/Header.vue'
export default {
  components:{
    Header
  },

  data(){
    return {

    }
  },
  mounted(){

  },
  methods:{
  
    // 加载详情页
    loadPage(lid){
      this.axios.get("/detail?lid="+lid).then(res=>{
        console.log(res.data);
      })
    }
  }
}

</script>

<style>

  .detail .mint-tab-item,.mint-tabbar>.mint-tab-item.is-selected{
    background-color: #fff;
  }
  .detail .mint-tabbar>.mint-tab-item>.mint-tab-item-label{
    text-align: center;
    height: 40px;
    font-size: 24px;
    line-height: 40px;
  }
  .detail .swipe{
    width: 100%;
    height: 200px;
  }
  .detail .swipe img{
    width: 100%;

  }
  .detail,.info{
    width: 100%;
    height: 100px;
    margin: 10px 0px;
    padding: 2px 4px;
    box-sizing: border-box;
    border: 1px solid rgb(228, 228, 228);
    border-radius: 8px;
  }
  .detail>.title{
    text-align: left;
    font-weight: bold;
    font-size: 18px;
  }
  .detail>.subtitle{
    text-align: left;
  }
  .detail>.furniture{
    width: 100%;
    height: 20px;
    line-height: 20px;
    display: flex;
    justify-content: space-between;
  }
  .detail .info{
    height: 220px;
  }
</style>