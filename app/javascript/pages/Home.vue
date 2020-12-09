<template>
<v-container class="home">
<!-- <h1>ホーム</h1>
<br />
<h3>今日やること</h3>
<ul>
  <li class="now">user-CRU実装（画像表示・レイアウト整形）</li>
  <li>post-CRUD実装</li>
  <li>画像アップロード機能</li>
  <li>ユーザー認証機能</li>
  <li>フォーム機能</li>
</ul>
<br />
<h3>その後やること</h3>
<ul>
  <li>時刻表記修正</li>
  <li>レスポンシブ化</li>
  <li>ransack実装</li>
</ul>

<br />
<h3>問題</h3>
<ul>
  <li>axiosのdestoryメソッドがサーバーに拒否される</li>
  <li>トップ画面の内部リンク不整合</li>
  <li>ユーザー画面の内部リンク不整合</li>
  <li>ドロワーの「メンバーディレクトリ」点滅する事象</li>
</ul> -->
<router-link to="/signup">signup</router-link>
</v-container>
</template>

<script>
import SaleGraph from '../components/SaleGraph.vue';
import Calc from './Calc'

export default {
  components: {
    SaleGraph,
    },
};
</script>

<style>
.home {
  text-align: center;
}

ul, li {
  list-style: none;
}

h1, h3 {
  margin: 16px 0;
}

.now, .check {
  color:red;
}
</style>
