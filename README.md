# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
##usersテーブル

| Culumn                | Type                  | Options                                  |
| --------------------- | --------------------- |------------------------------------------|
| nickname              |  string               | null:false                               |
| email                 |  string               | null:false                               |
| password              |  string               | null:false                               |


###Association

- has_many :items
- has_many :purchases

##itemsテーブル
| Culumn                | Type                  | Options                                  |
| --------------------- | --------------------- |------------------------------------------|
| name                  |  string               | null:false                               |
| images                |  interger             | null:false                               |
| caregory              |  integer              | null:false                               |
| condition             |  integer              | null:false                               |
| description_item      |  text                 | null:false                               |
| price                 |  integer              | null:false                               |
| schedule_item         |  integer              | null:false                               |
| prefecture            |  integer              | null:false                               |
| shoppig_fee           |  integer              | null:false                               |
| user_id               |  references           | null:false  foreign_key: true                             |


 ###association
 
 - has_one :author
 
 
##purchaseテーブル
| Culumn                | Type                  | Options                                  |
| --------------------- | --------------------- |------------------------------------------|
| creddit_card_number   |  integer              | null:false                               |                     
| expiration_date       |  date                 | null:false                               |
| security_code         |  integer              | null:false                               |
| postal_code           |  integer              | null:false                               |
| prefecture            |  string               | null:false                               |
| municipality          |  string               | null:false                               |
| address               |  string               | null:false                               |
| building_name         |  string               | null:false                               |
| phone_number          |  integer              | null:false                               |
| user_id               |  references           | null:false    foreign_key: true          |
| item_id               |  references           | null:false    foreign_key: true          |


###association

-has_many :users
-belongs_to :item

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
