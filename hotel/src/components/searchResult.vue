<template>
  <div class="searchResult">
    <Header/>


    <!-- 内容开始 -->
    <div
      v-infinite-scroll="loadMore"
      infinite-scroll-disable="loading"
      infinite-scroll-distance="10"
      infinite-scroll-immediate-check="true"
    >
      <mt-tab-container v-model="active">
        <mt-tab-container-item :id="`${active}`">
          <div v-for="(val,key) of searRes" :key=key>
            <router-link :to="`/detail/${val.lid}`">
              <div class="context">
                <!-- 左侧图片 -->
                <img v-lazy="`${img1[key]}`" class="imgSize">
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
        </mt-tab-container-item>
      </mt-tab-container>
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
      active:'1',
      loading:false,
      pageCount:0,    //总页数
      page:1,         //页码
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
  watch:{
    active(){
      // this.searRes=[];
      this.page=1;
      this.loadPage(this.addr,this.price,this.page);
    }
  },
  methods:{
    pay(){
      // 参数：用户id，当前选项结果id
      
    },
      // 无限滚动
    loadMore(){
      this.page++;
      this.loading=true;
      if(this.page<=this.pageCount){
        // 加载数据
        
        this.loadPage(this.addr,this.price,this.page);
       
      }

    },
    /**
     * 加载搜索结果
     * @param addr  char ,表示地区,例如"龙华"
     * @param price number ,表示价格,例如"980"
     * @param page  number ,表示页码,例如"1"
     */
    loadPage(addr,price,page){
      // 加载提示框
      this.$indicator.open({
        text:"加载中...",
        spinnerType:"snake"
      })
      // 请求数据 
      this.axios.get("/result/result?addr="+addr+"&price="+price+"&page="+page).then(res=>{
        let data=res.data.results;
        
        this.pageCount=res.data.pageCount;
        
       
        data.forEach(element => {
          // console.log(element.img1);//图片文件名
          // 动态拼接图片路径
          element.img1=require("../assets/image/img1/"+element.img1);
          // data.push(img)
          // console.log(element.img1)
          this.img1.push(element.img1); //处理图片路径
          this.searRes.push(element);   //将处理好的数据添加到数组中
        });
        // 加载数据期间不允许滚动
        this.loading=false;
        // 关闭加载提示框
        this.$indicator.close();
      })
    }
  },
  mounted(){
    this.loadPage(this.price,this.addr,this.page);
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