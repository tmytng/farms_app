<template>
<v-container>
<h1>ホーム</h1>
<br />
<p><router-link to='/users/'>ユーザーインデックスのリンク</router-link></p>
<p><router-link to='/users/new'>ユーザー新規作成のリンク</router-link></p>
<br />
<br />
<p><router-link to='/projects/'>プロジェクトインデックスのリンク</router-link></p>
<p><router-link to='/projects/new'>プロジェクト新規作成のリンク</router-link></p>
<br />

<br />
<p><router-link to='/enterprise'>エンタープライズのリンク</router-link></p>
<p><router-link to='/about'>アバウトのリンク</router-link></p>

</v-container>
</template>

<script>
import SaleGraph from '../components/SaleGraph'
import Calc from './Calc'

export default {
};
</script>

<style scoped>
</style>
