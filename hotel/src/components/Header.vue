 <template>
  <div>
 <!-- 标题栏开始 -->
    <div class="header">
      <mt-header title="Hotel">
        
        <mt-button slot="left" icon="back">返回</mt-button>
        <mt-button slot="right" class="btn">
          <img src="../assets/icon/geolocation.png" slot="icon">
        </mt-button>
        <mt-button slot="right" icon="more"></mt-button>
      </mt-header>
    </div>
    <!-- 标题栏结束 -->
  </div>
</template>
<style>
  .mint-header{
    background-color: indigo;
  }
</style>