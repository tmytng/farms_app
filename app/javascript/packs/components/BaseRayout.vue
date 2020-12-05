<template>
  <v-app>
    <v-navigation-drawer app v-model="drawer" clipped >
      <v-container>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title class="title grey--text text--darken-2">
              アカウントメニュー
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-divider></v-divider>
          <v-list nav dense>
            <v-list-group
              v-for="nav_list in nav_lists"
              :key="nav_list.name"
              :prepend-icon="nav_list.icon"
              no-action
              :append-icon="nav_list.lists ? undefined : ''">
            <template v-slot:activator>
              <v-list-item-content>
                <v-list-item-title>{{ nav_list.name }}</v-list-item-title>
              </v-list-item-content>
            </template>
              <v-list-item v-for="list in nav_list.lists" :key="list">
                <v-list-item-content>
                  <v-list-item-title>{{ list }}</v-list-item-title>
                </v-list-item-content>
              </v-list-item>
            </v-list-group>
          </v-list>
      </v-container>
    </v-navigation-drawer>
    <v-app-bar color="primary" dark app clipped-left>
    <v-app-bar-nav-icon @click="drawer=!drawer"></v-app-bar-nav-icon>
    <v-toolbar-title>FARMS</v-toolbar-title>
    <v-spacer></v-spacer>
    <v-toolbar-items>
<v-btn text to="/enterprise">For Enterprise</v-btn>
<v-menu offset-y>
  <template v-slot:activator="{on}">
  <v-btn v-on="on" text>Support<v-icon>mdi-menu-down</v-icon></v-btn>
  </template>
  <v-list>
　<v-subheader>Get help</v-subheader>
  <v-list-item v-for="support in supports" :key="support.name">
  <v-list-item-icon>
  <v-icon>{{ support.icon }}</v-icon>
  </v-list-item-icon>
  <v-list-item-content>
  <v-list-item-title>{{ support.name }}</v-list-item-title>
  </v-list-item-content>
</v-list-item>
</v-list>
</v-menu>
</v-toolbar-items>
    </v-app-bar>
    <v-main>
      <router-view />
    </v-main>
    <v-footer color="primary" dark app>
      Vuetify
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data(){
    return{
        drawer: false,
        supports:[
          {name: 'Consulting and suppourt',icon: 'mdi-vuetify'},
          {name: 'Discord community',icon: 'mdi-discord'},
          {name: 'Report a bug',icon: 'mdi-bug'},
          {name: 'Github issue board',icon: 'mdi-github'},
          {name: 'Stack overview',icon: 'mdi-stack-overflow'},
        ],
        nav_lists:[
          {
            name: '谷口太郎',
            icon: 'mdi-speedometer',
          },
          {
            name: 'ユーザー情報変更',
            icon: 'mdi-function'
          },
          {
            name: 'プロジェクト一覧',
            icon: 'mdi-cogs'
          },
          {
            name: 'メンバーディレクトリ',
            icon: 'mdi-palette',
          },
          {
            name: '管理者メニュー',
            icon: 'mdi-view-dashboard',
            lists:['プロジェクト新規作成','ユーザー新規作成']
          },
          {
            name: 'ログアウト',
            icon: 'mdi-vuetify'
          }
        ]
    }
  }
}
</script>
