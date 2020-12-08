<template>
  <v-app>
    <!-- サイドバー -->
    <v-navigation-drawer app v-model="drawer" dark right >
      <v-container>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title class="title white--text text--darken-1">
              テスト 太郎
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-divider></v-divider>
  <v-list nav dense>
      <template v-for="nav_list in nav_lists">
          <v-list-item
              v-if="!nav_list.lists"
              :to="nav_list.link"
              :key="nav_list.name"
                @click="menu_close"
          >
              <v-list-item-icon>
                <v-icon>{{ nav_list.icon }}</v-icon>
              </v-list-item-icon>
              <v-list-item-content>
                <v-list-item-title>
                  {{ nav_list.name }}
                </v-list-item-title>
              </v-list-item-content>
          </v-list-item>
          <v-list-group
              v-else
              no-action
              :prepend-icon="nav_list.icon"
              :key="nav_list.name"
              v-model="nav_list.active"
          >
              <template v-slot:activator>
                  <v-list-item-content>
                    <v-list-item-title>
                      {{ nav_list.name }}
                    </v-list-item-title>
                  </v-list-item-content>
              </template>
              <v-list-item
                  v-for="list in nav_list.lists"
                  :key="list.name"
                  :to="list.link"
              >
              <v-list-item-title>
                {{ list.name }}
              </v-list-item-title>
              </v-list-item>
          </v-list-group>
      </template>
  </v-list>
    </v-container>
  </v-navigation-drawer>
    <!-- メインコンテンツ -->
    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
import axios from 'axios'
export default {
  methods:{
          menu_close(){
            this.nav_lists.forEach( nav_list => nav_list.active = false)
          }
  },
  data(){
    return{
      drawer: null,
      userInfo: {
        id:	1,
        name:	"久保田 太郎",
        },
      nav_lists:[
        {
          name: 'ユーザー情報変更',
          icon: 'mdi-cogs',
          link: '/users/1'
        },
        {
          name: 'プロジェクト一覧',
          icon: 'mdi-view-dashboard',
          link: '/projects/'
        },
        {
          name: 'メンバーディレクトリ',
          icon: 'mdi-function',
          link: '/users'
        },
        {
          name: '管理者機能',
          icon: 'mdi-palette',
          link: '',
          active: false,
          lists:[{
            name :'プロジェクト新規作成', link:'/projects/new'
            },
            {
            name :'メンバー新規作成', link:'/users/new'
            },
            {
            name :'管理者権限変更', link:''}
          ]
        },
        {
          name: 'ログアウト',
          icon: 'mdi-function',
          link: ''
        },
      ]
    }
  },
  // created() {
  //   axios.get(`api/users/${id}.json`).then(res => {
  //   this.UserInfo = res.data;
  //   })
  // },
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
.title {
  font-weight: bold;
}
</style>
