<template>
  <div class="searchResult">
    <Header/>
    <!-- 顶部导航栏开始 -->
    <div class="nav">
      <Droplist></Droplist>
    </div>
    <!-- 顶部导航栏结束 -->

    <!-- 内容开始 -->
    <div v-for="(val,key) of searRes" :key=key>
      <router-link :to="`/detail?lid=${val.lid}`">
        <div class="context">
          <!-- 左侧图片 -->
          <img src="../assets/logo.png" alt="" class="imgSize">
          <!-- 右侧内容 -->
          <div class="right_context">
            <h5 class="title" v-text="val.title">标题</h5>
            <p  v-text="`${val.subtitle}`">副标题</p>
            <p class="position"><span v-text="`区域:${val.position}`">位置</span><span v-text="`面积:${val.area}`">面积</span></p>
            <p class="p_btn"><span v-text="`价格:￥${val.price}`">￥126起</span> 
              <mt-button type="primary" size=small @click="pay" class="mybutton">下订单</mt-button>
            </p>
          </div>
        </div>
      </router-link>
    </div>
    <!-- 内容结束 -->
  </div>
</template>

<script>
import Droplist from '@/components/Droplist.vue'
import Header from '@/components/Header.vue'
export default {
  components:{
    Droplist,
    Header
  } ,
  data(){
    return {
      price:"",
      addr:"",
      title:"",
      subtitle:"",
      img1:[],
      area:"",
      position:"",
      searRes:[]
    }
  },
  methods:{
    pay(){
      // 参数：用户id，当前选项结果id
      
    },
    loadPage(addr,price){
      this.axios.get("/result/result?addr="+addr+"&price="+price).then(res=>{
        // console.log(res.data);
        let data=res.data;
        this.searRes=data;
      })
    }
  },
  mounted(){
    this.loadPage(this.price,this.addr)
  }
}
</script>

<style>
  .btn{
    margin:0px 20px;
  }
  .nav input{
    border: 1px solid salmon;
    border-radius: 5px;
  }
  .imgSize{
    width: 30%;
    /* height: 80px; */
    /* line-height: 120px; */
    border: 1px solid salmon;
  }

  .context{
    height: 110px;
    display: flex;
    margin: 10px 10px;
    border: 1px solid rgb(139, 139, 139);
    
  }
  a{
    text-decoration: none;
    color: rgb(66, 66, 66);
  }
  .right_context{
    width: 100%;
    padding: 5px;
    /* border: 1px solid salmon; */
    text-align: left;
  }
  .right_context>.title{
    width: 100%;
    font-weight: bold;
    font-size: 16px;
    margin: 5px;
    display: -webkit-box;         /*对象作为弹性伸缩盒子模型显示 */
    -webkit-box-orient: vertical; /*设置或检索伸缩盒对象的子元素的排列方式 */
    -webkit-line-clamp: 1;        /*溢出省略的界限*/
    overflow:hidden;              /*设置隐藏溢出元素*/
  }
  .mybutton{
    float: right;
  }
  .p_btn{
    height: 35px;
    line-height: 35px;
    vertical-align: middle;
  }
  .right_context>p{
    margin: 5px 0;
  }
  .position{
    display: flex;
    justify-content: space-between;
  }

</style>