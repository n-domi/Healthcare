![5543452c7a82d7b5cacf46224d8cf4f0](https://user-images.githubusercontent.com/59164751/76047940-a1fb4e80-5fa7-11ea-8bed-99e7399fdaca.jpg)


Link→  https://rocky-depths-03246.herokuapp.com/

# Name

Healthcare

# Overview

食事管理をするヘルスケアアプリです。

# Description

自分の食事を記録し、それに対し feelgood!ボタン または feelbad!ボタン を押していただき、自分に合った食事をデータから分析することができます

実装済みの機能↓

ユーザー機能（新規登録、ログイン、ログアウト、編集） 

食事の記録（新規作成、一覧・詳細表示、編集、削除） 

体調管理（good/badの登録、およびその一覧表示） 

# Background

食事法、食事術などの本をよく読んでいた頃に自分の食生活を変えたら、体調が驚くほどよくなった経験がありました。

そこで、アプリを作り、食生活の改善をサポートできるのではないかと考えたのがきっかけです。

# Demo

[d43beafd026d426b0f51f5e83a10df7a.mp4.zip](https://github.com/n-domi/Healthcare/files/4296326/d43beafd026d426b0f51f5e83a10df7a.mp4.zip)

テストアカウント=>email:1@1,password:11111111

# 使用した技術

Ruby on Rails(version 2.5.1),HTML,CSS

mysql2 0.5.3(開発環境)、postgresql(本番環境)

# Usage

まずはユーザー登録をしていただき、自分の食事内容とその日の調子を記録してください。

# Author

https://github.com/n-domi

# これから実装したいこと

・ヘッダーをなくし、サイドバー形式にし、より多くのデータを一度にみられるようにする 

・食事記録の新規作成の際にアレルゲンも記録できるようにする 

・見た目を本格的に（全体の統一感、ロゴの作成など) 

・JavaScriptでサイトに動きをつけてより良い体験を提供する 

・レスポンシブデザインの実装（スマートフォンやタブレットでの利用を考慮） 

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|                   #ユーザー名
|email|string|null: false, unique: true|    #メールアドレス
|password|string|null: false|               #パスワード

### Association
- has_many :records

## recordsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|                         #食事内容
|user_id|integer|null: false, foreign_key: true|   #ユーザーid

### Association
- belongs_to :user
- has_one :goodfeeling, dependent: :destroy
- has_one :badfeeling, dependent: :destroy

## goodfeelingsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|   #ユーザーのid
|record_id|integer|null: false, foreign_key: true|  #記録のid

### Association
- belongs_to :user
- belongs_to :records

## badfeelingsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|   #ユーザーのid
|record_id|integer|null: false, foreign_key: true|  #記録のid

### Association
- belongs_to :user
- belongs_to :records