<template>
  <div>
    <div class="topbar">
      <label class="mylabel" @click="status('distance')"
        >位置距离<img src="../assets/icon/dropdown.png"
      /></label>
      <label class="mylabel" @click="status('price')"
        >价格/星级<img src="../assets/icon/dropdown.png"
      /></label>
      <label class="mylabel" @click="status('recommend')"
        >推荐排序<img src="../assets/icon/dropdown.png"
      /></label>
      <!-- <label class="mylabel" @click="status('screen')">筛选<img src="../assets/icon/dropdown.png"></label> -->
    </div>
    <!-- 弹出框 -->
    <mt-popup position="bottom" v-model="popupVisible">
      <!-- 位置距离 -->
      <div v-if="selStatus == 'distance'">
        <mt-cell title="位置距离">
          <span @click="btn(selDistance)">确定</span>
        </mt-cell>
        <mt-picker :slots="slotDis" @change="onValuesChangeDis"></mt-picker>
      </div>

      <!-- 价格 -->
      <div v-else-if="selStatus == 'price'">
        <mt-cell :title="`价格/星级${selPrice}`">
          <span @click="btn(selPrice)">确定</span>
        </mt-cell>
        <mt-picker :slots="slotsPri" @change="onValuesChangePri"></mt-picker>
      </div>
      <!-- 推荐 -->
      <div v-if="selStatus == 'recommend'">
        <mt-cell title="排序"></mt-cell>

        <!-- <mt-picker :slots="slotDistance" @change="onValuesChange"></mt-picker> -->
      </div>
      <!-- 筛选 -->
      <!-- <div v-if="selStatus=='screen'"> -->
      <!-- <mt-cell title="筛选"></mt-cell> -->

      <!-- <mt-picker :slots="slotDistance" @change="onValuesChange"></mt-picker> -->
      <!-- </div> -->
    </mt-popup>
  </div>
</template>

<style>
.topbar {
  display: flex;
  justify-content: space-around;
  border-bottom: 2px solid rgb(139, 142, 145);
}
/* .topbar > button {
  width: 24%;
  font-size: 14px;
} */
.mycell {
  /* width: 100%; */
}
.mint-popup {
  width: 100%;
}
.mylabel {
  height: 35px;
  line-height: 35px;
}
.mylabel > img {
  padding: 4.5px;
  vertical-align: middle;
}
</style>

<script>
export default {
  data() {
    return {
      popupVisible: false,
      selDistance: "",
      selStatus: "",
      selPrice: "",
      arr:[],
      // 距离选项
      slotDis: [
        {
          flex: 1,
          values: ["500m", "1500m", "3000m", "5000m"],
          textAlign: "center",
        },
      ],
      // 价格选项
      slotsPri: [
        {
          flex: 1,
          values: ["1000及以下", "1001-2000", "2001以上"],
          className: "slot1",
          textAlign: "center",
        },
      ],
    };
  },
  props:["result"], //父组件传过来的值
  methods: {
    status(params) {
      if (params == "distance") {
        this.selStatus = "distance";
      } else if (params == "price") {
        this.selStatus = "price";
      } else if (params == "recommend") {
        this.selStatus = "recommend";
      }
      this.popupVisible = !this.popupVisible;
    },
    // 距离筛选
    onValuesChangeDis(pricker, values) {
      this.selDistance = values[0];
    },
    // 价格筛选
    onValuesChangePri(picker, values) {
      // console.log(picker);
      // console.log(values);
      this.selPrice = values[0];
    },
    btn(params) {
      console.log("#/" + params);
      this.selPrice=parseInt(this.selPrice);
      
      switch(this.selPrice){
        case 1000:
          this.result.forEach(element => {
            if(element.price<1000){
              this.arr.push(element)
            }
          });
          console.log(this.arr);
          this.setUser();
          break;
        case 1001:
          this.result.forEach(element => {
            if(element.price>999&&element.price<2001){
              this.arr.push(element)
            }
          });
          console.log(this.arr);
          this.setUser();
          break;
        case 2001:
          this.result.forEach(element => {
            if(element.price>2000){
              this.arr.push(element)
            }
          });
          console.log(this.arr);
          this.setUser();
          break;
      }
      this.popupVisible = false;
    },
    // 子组件给父组件传值
    setUser:function(){
      this.$emit("pushValues",this.arr);
    }
  },
  mounted(){
    // 便利页面内的所有数据
    // console.log(this.result);
    // this.result.forEach(element => {
    //   console.log(element.price)
    // });
  }
};
</script>