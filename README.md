# README

## アプリケーション名・yon-taQ

四択問題投稿し、その問題を遊べるアプリケーション

## URL
  [Yon-taQ](https://yon-taq.herokuapp.com/)

## テスト用アカウント


## 利用方法
・サイトにアクセスしたらログインをしてください  
・問題投稿ページでは、問題文の入力・選択肢を4つ記入し  
　問題を投稿することができます  
・クイズで遊ぶを選ぶとデータベースに投稿された問題が表示され  
　選択肢を選ぶことで正誤判定が可能です  

## 要件定義
・ログイン機能  
・クイズ投稿機能  
・クイズプレイ機能  

## 実装予定の機能
・投稿されたクイズの編集機能  
・投稿されたクイズの削除機能  
・ユーザーページ実装  
・正解率表示

## DB設計

## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |

### Association

- has_many :quizzes

## quizzesテーブル

| Column          | Type        | Options                       |
| --------------- | ----------- | ----------------------------- |
| quiz            | text        | null: false                   |
| user            | references  | null: false, foreign_key: true|

### Association

- has_many :choices
- belongs_to :user

## choicesテーブル

| Column          | Type        | Options                       |
| --------------- | ----------- | ----------------------------- |
| choice          | string      | null: false                   |
| answer_is       | boolean     | null: false                   |
| quiz            | references  | null: false, foreign_key: true|

### Association

- belongs_to :quiz