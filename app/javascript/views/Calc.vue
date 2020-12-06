<template>
<v-container>
<p>カウント:{{ count }}
<button v-on:click="countUp">Up</button>
<button v-on:click="countDown">Down</button></p>
</v-container>
</template>

<script>
export default {
  data: function(){
    return {
      count : 0
    }
  },
  methods: {
    countUp: function(){
      this.count++
    },
    countDown: function(){
      this.count--
    },
  }
}
</script>
