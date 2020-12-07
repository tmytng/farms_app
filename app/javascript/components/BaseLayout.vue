<template>
  <v-app>
    <!-- サイドバー -->
    <v-navigation-drawer
      v-model="drawer"
      :clipped="$vuetify.breakpoint.lgAndUp"
      app right dark
    >
      <v-list dense>
        <template v-for="item in items" :to="item.link">
          <v-row
            v-if="item.heading"
            :key="item.heading"
            align="center"
          >
          </v-row>
          <v-list-group
            v-else-if="item.children"
            :key="item.text"
            v-model="item.model"
            :prepend-icon="item.model ? item.icon : item['icon-alt']"
            append-icon=""
          >
            <template v-slot:activator>
              <v-list-item-content>
                <v-list-item-title>
                  {{ item.text }}
                </v-list-item-title>
              </v-list-item-content>
            </template>
            <v-list-item
              v-for="(child, i) in item.children"
              :key="i"
              link

            >
              <v-list-item-action v-if="child.icon">
                <v-icon>{{ child.icon }}</v-icon>
              </v-list-item-action>
              <v-list-item-content>
                <v-list-item-title>
                  {{ child.text }}
                </v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list-group>
          <v-list-item
            v-else
            :key="item.text"
            link
          >
            <v-list-item-action>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-action>
            <v-list-item-content>
              <v-list-item-title>
                {{ item.text }}
              </v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </template>
      </v-list>
    </v-navigation-drawer>

    <!-- グローバルメニュー -->
    <v-app-bar
      :clipped-left="$vuetify.breakpoint.lgAndUp"
      app
      color="teal darken-4"
      dark
    >
    <!-- ツールバータイトル -->
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
      <v-app-bar-nav-icon @click.stop="drawer = !drawer">
        <v-avatar
          size="32px"
          item
        >
          <v-img
            src="https://cdn.vuetifyjs.com/images/logos/logo.svg"
            alt="ユーザー画像"
          ></v-img></v-avatar></v-app-bar-nav-icon>
    </v-app-bar>
    <!-- メインコンテンツ -->
    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
export default ({
  data: () => ({
    dialog: false,
    drawer: false,
    items: [
      { icon: 'mdi-contacts', text: '谷口太郎' },
      { icon: 'mdi-history', text: 'ユーザー情報変更' },
      { icon: 'mdi-content-copy', text: 'プロジェクト一覧' },
      { icon: 'mdi-content-copy', text: 'メンバーディレクトリ', link: '/users/' },
      { icon: 'mdi-content-copy', text: 'プロジェクト新規作成' },
      { icon: 'mdi-content-copy', text: 'ユーザー新規作成' },
    ],
  }),
})
</script>
<style scoped>
a:hover,
a:link,
a:visited,
a:active {
  color: #fff;
  text-decoration: none;
}</style>
