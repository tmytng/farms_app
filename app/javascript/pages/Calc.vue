<template>
<v-container>
<p>カウント:{{ count }}
<v-btn v-on:click="countUp">Up</v-btn>
<v-btn v-on:click="countDown">Down</v-btn></p>
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
