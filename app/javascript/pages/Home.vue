<template>
<v-container class="home">
<h1>ホーム</h1>
<br />
<h3>今日やること</h3>
<ul>
  <li>pj-destroy機能実装</li>
  <li>user-CRUD実装</li>
  <li>post-CRUD実装</li>
  <li>画像アップデート機能</li>
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

</v-container>
</template>

<script>
import SaleGraph from '../components/SaleGraph.vue';
import Calc from './Calc'

export default {
  components: { SaleGraph },
};
</script>

<style scoped>
.home {
  text-align: center;
}

ul, li {
  list-style: none;
}

h1, h3 {
  margin: 16px 0;
}
</style>
