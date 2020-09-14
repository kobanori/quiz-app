# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column    | Type    | Options      |
| --------- | ------- | ------------ |
| nickname  | string  | null: false  |
| email     | string  | null: false  |
| password  | string  | null: false  |


### Association

- has_many :quizes
- has_many :answers
- has_many :reactions
- has_many :hides

## quizes テーブル

| Column         | Type        | Options                         |
| -------------- | ----------- | ------------------------------- |
| title          | string      | null: false                     |
| question       | text        | null: false                     |
| answer_number  | integer     | null: false                     |
| genre          | string      |                                 |
| edit_new_id    | integer     |                                 |
| author_hide    | integer     |                                 |
| user           | references  | null: false, foreign_key: true  |
| choise         | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :groups
- has_one :choise
- has_one :answer
- has_many :hides
- has_many :reactions

## groups テーブル

| Column  | Type     | Options      |
| ------- | -------- | ------------ |
| name    | integer  | null: false  |
| quiz_1  | integer  | null: false  |

### Association
- has_many :quizes
- belongs_to :hides

## choises テーブル

| Column    | Type        | Options                         |
| --------- | ----------- | ------------------------------- |
| choise_1  | integer     | null: false                     |
| choise_2  | integer     |                                 |
| choise_3  | integer     |                                 |
| choise_4  | integer     |                                 |
| quiz      | references  | null: false, foreign_key: true  |

### Association

- belongs_to :quiz

## answers テーブル

| Column  | Type        | Options                         |
| ------- | ----------- | ------------------------------- |
| answer  | integer     | null: false                     |
| user    | references  | null: false, foreign_key: true  |
| quiz    | references  | null: false, foreign_key: true  |


### Association

- belongs_to :user
- belongs_to :quiz

## reactions テーブル

| Column   | Type        | Options                         |
| -------- | ----------- | ------------------------------- |
| comment  | text        |                                 |
| good     | integer     |                                 |
| user     | references  | null: false, foreign_key: true  |
| quiz     | references  | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :quiz

## hides テーブル

| Column  | Type        | Options                         |
| ------- | ----------- | ------------------------------- |
| user    | references  | null: false, foreign_key: true  |
| quiz    | references  | foreign_key: true               |
| group   | references  | foreign_key: true               |

### Association

- belongs_to :user
- belongs_to :quiz
- belongs_to :group