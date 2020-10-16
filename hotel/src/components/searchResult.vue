<template>
  <div class="searchResult">
    <!-- 标题栏开始 -->
    <div class="SR_title">
      <mt-header title="Hotel">
        
        <mt-button slot="left" icon="back">返回</mt-button>
        <mt-button slot="right" class="btn">
          <img src="../assets/icon/geolocation.png" slot="icon">
        </mt-button>
        <mt-button slot="right" icon="more"></mt-button>
      </mt-header>
    </div>
    <!-- 标题栏结束 -->
    <!-- 顶部导航栏开始 -->
    <div class="nav">
      <Droplist></Droplist>
    </div>
    <!-- 顶部导航栏结束 -->

    <!-- 内容开始 -->
    <div>
      <div class="context">
        <!-- 左侧图片 -->
        <img src="../assets/logo.png" alt="" class="imgSize">
        <!-- 右侧内容 -->
        <div class="right_context">
          <h5 class="title">标题</h5>
          <p>副标题</p>
          <p><span>位置</span><span>面积</span></p>
          <p><span>￥126起</span></p>
          <mt-button type="primary" size=small>下订单</mt-button>
        </div>
      </div>
    </div>
    <!-- 内容结束 -->
  </div>
</template>

<script>
import Droplist from '@/components/Droplist.vue'
export default {
  components:{
    Droplist
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
    width: 80px;
    height: 80px;
    line-height: 120px;
    border: 1px solid salmon;
  }

  .context{
    height: 120px;
    display: flex;
    margin: 10px 10px;
    border: 1px solid salmon;
  }
  .right_context{
    width: 100%;
    border: 1px solid salmon;
    text-align: left;
  }
  .title{
    width: 100%;
    height: 15px;
    margin: 5px;
    display: -webkit-box;         /*对象作为弹性伸缩盒子模型显示 */
    -webkit-box-orient: vertical; /*设置或检索伸缩盒对象的子元素的排列方式 */
    -webkit-line-clamp: 1;        /*溢出省略的界限*/
    overflow:hidden;              /*设置隐藏溢出元素*/
  }
</style>