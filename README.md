# README

## 概要

### FARMS とは？

FARMS（ファームス）は 1 人〜15 人前後の小規模チームを想定した営業支援ツールです。
チームメンバーそれぞれが日々の顧客とのやりとりを記録していくことで、
その情報をチーム全体で共有することができます。

### 想定している基本の使用方法

1. テストユーザー（管理者アカウント）でユーザーログインをします。
2. アサインする「プロジェクト」を選択します。
3. プロジェクト画面下部の「新規登録」アイコンを選択します。
4. 問い合わせのあった顧客の情報について登録を行います。

## 開発環境

・Ruby 2.6.5<br>
・Rails 6.0.3.2<br>
・AWS（EC2,IAM, S3）<br>
・MySQL<br>
・nginx,unicorn<br>
・VSCode, Vim<br>
・Vue 2.6<br>

## 主な使用技術

・capistrano（デプロイ自動化）<br>
・HAML（テンプレートエンジン）<br>
・SASS（BEM・グリッドデザイン）<br>
・Active Storage（添付ファイル管理）<br>
・Bootstrap（レスポンシブ・UI）<br>
・RSpec（テスト）<br>
・Rubocop（静的解析）<br>
・Action Text（投稿機能）<br>

## 主な機能

・プロジェクト作成・編集・削除機能<br>
・ユーザー作成・編集・削除機能<br>
・問い合わせ記録の登録・編集・削除機能<br>
・案件管理機能<br>
・案件ストック機能（フェイバリット機能）<br>
・プロジェクト掲示板・コメント入力機能<br>
・ユーザー管理権限機能<br>
・登録データの CSV エクスポート<br>
