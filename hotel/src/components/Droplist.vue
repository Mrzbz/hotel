<template>
  <div>
    <div class="topbar">
      <label class="mylabel" @click="status('distance')">位置距离<img src="../assets/icon/dropdown.png"></label>
      <label class="mylabel" @click="status('price')">价格/星级<img src="../assets/icon/dropdown.png"></label>
      <label class="mylabel" @click="status('recommend')">推荐排序<img src="../assets/icon/dropdown.png"></label>
      <label class="mylabel" @click="status('screen')">筛选<img src="../assets/icon/dropdown.png"></label>
    </div>
    <!-- 弹出框 -->
    <mt-popup
      position="bottom"
      v-model="popupVisible">
      <!-- 位置距离 -->
      <div v-if="selStatus=='distance'">
        <mt-cell title="位置距离">
            <span @click="btn(selDistance)">确定</span>
        </mt-cell>
        <mt-picker :slots="slotDis" @change="onValuesChangeDis"></mt-picker>
      </div>

      <!-- 价格 -->
      <div v-else-if="selStatus=='price'">
        <mt-cell :title="`价格/星级${selPrice}`">
          <span @click="btn(selPrice)">确定</span>
        </mt-cell>
        <mt-picker :slots="slotsPri" @change="onValuesChangePri"></mt-picker>
      </div>
      <!-- 推荐 -->
      <div v-if="selStatus=='recommend'">
        <mt-cell title="推荐排序"></mt-cell>

        <!-- <mt-picker :slots="slotDistance" @change="onValuesChange"></mt-picker> -->
      </div>
      <!-- 筛选 -->
      <div v-if="selStatus=='screen'">
        <mt-cell title="筛选"></mt-cell>

        <!-- <mt-picker :slots="slotDistance" @change="onValuesChange"></mt-picker> -->
      </div>
    </mt-popup>
    
  </div>
</template>

<style>
.topbar {
  display: flex;
  justify-content: space-around;
  border-bottom:2px solid rgb(139, 142, 145) ;
}
/* .topbar > button {
  width: 24%;
  font-size: 14px;
} */
.mycell{
  /* width: 100%; */
}
.mint-popup{
  width: 100%;
}
.mylabel{
  height: 35px;
  line-height: 35px;

}
.mylabel>img{
  padding: 4.5px;
    vertical-align: middle;
}
</style>

<script>
export default {
  data() {
    return {
      popupVisible:false,
      selDistance:'',
      selStatus:'',
      selPrice:'',

      // 距离选项
      slotDis:[
        {
          flex:1,
          values:['500m','1500m','3000m','5000m'],
          textAlign:"center"
        }
      ],
      // 价格选项
      slotsPri:[
        {
          flex:1,
          values:['1-255','255-500','500以上'],
          className:'slot1',
          textAlign:"center"
        }
      ]
    };
  },
  methods: {
    status(params) {

      if(params== 'distance'){
        this.selStatus='distance';
      }else if(params=='price'){
        this.selStatus='price';
      }else if(params=='recommend'){
        this.selStatus='recommend';
      }else if(params=='screen'){
        this.selStatus='screen';
      }
      this.popupVisible=!this.popupVisible;
    },
    // 距离筛选
    onValuesChangeDis(pricker,values){
      this.selDistance=values[0];
      
    },
    // 价格筛选
    onValuesChangePri(picker,values){
      this.selPrice=values[0];
    },
    btn(params){
      // 路由跳转
       console.log("#/"+params);
       this.popupVisible=false;
    }
  },
};
</script>