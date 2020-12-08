<template>
  <v-app>
    <div id="App">
      <Header />
      <v-main>
        <v-container />
      </v-main>
      <Footer />
    </div>
  </v-app>
</template>

<script>
import Header from './components/organisms/Header.vue'
import Footer from './components/organisms/Footer.vue'

export default {
  components: {
    Header,
    Footer,
  },
}

</script>
