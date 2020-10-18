<template>
  <div class="home">
    <!-- <img alt="Vue logo" src="../assets/logo.png"> -->
    <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->
    <!-- <searchResult/> -->
    <!-- <Detail/> -->
    
    123home

    <!-- <Navbar/> -->

  </div>
</template>

<script>
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'
import SearchResult from '@/components/SearchResult.vue'
import Navbar from '@/components/Navbar.vue'
import Detail from '@/components/Detail.vue'

export default {
  name: 'Home',
  components: {
    // HelloWorld,
    SearchResult,
    Navbar,
    Detail
  }
}
</script>
<style>
   /* .mint-header{
    background-color: indigo;
  } */
</style>