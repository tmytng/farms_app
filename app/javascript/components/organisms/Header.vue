<template>
  <v-app-bar
    :clipped-left="$vuetify.breakpoint.lgAndUp"
    app
    color="teal darken-4"
    dark
  >
    <v-toolbar-title
      style="width: 416px"
      class="ml-0 pl-4"
    >
      <span class="hidden-sm-and-down"><router-link to="/">FARMS</router-link></span>
    </v-toolbar-title>
    <v-text-field
      flat
      solo-inverted
      hide-details
      prepend-inner-icon="mdi-magnify"
      label="Search"
      class="hidden-sm-and-down"
    ></v-text-field>
    <v-spacer></v-spacer>
    <v-app-bar-nav-icon @click.stop="drawer = !drawer" >
      <v-avatar
        size="48px"
        item
        class="user-avatar"
      >
        <v-img
          src="https://i.gyazo.com/384257c3e613a8209685217013568b9d.png"
          alt="ユーザー画像"
        ></v-img></v-avatar></v-app-bar-nav-icon>
  </v-app-bar>
</template>

<script>
export default {

}
</script>

<style scoped>
a:hover,
a:link,
a:visited,
a:active {
  color: #fff;
  text-decoration: none;
}
.user-avatar {
  margin-right: 1.2em;
}
</style>
