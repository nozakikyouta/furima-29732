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
| birthday              |  date     　　　       | null:false
| first_name_kana       |  string               | null:false                               |
| last_name_kana        |  string               | null:false                               |
| first_name            |  string               | null:false                               |
| last_name             |  string               | null:false                               |
| password confirmation |  string               | null:false                               |



###Association

- has_many :items
- has_many :purchases

##itemsテーブル
| Culumn                | Type                  | Options                                  |
| --------------------- | --------------------- |------------------------------------------|
| name                  |  string               | null:false                               |
| caregory_id           |  integer              | null:false                               |
| condition_id          |  integer              | null:false                               |
| description_item      |  text                 | null:false                               |
| price                 |  integer              | null:false                               |
| schedule_item_id      |  integer              | null:false                               |
| prefecture_id         |  integer              | null:false                               |
| shoppig_fee_id        |  integer              | null:false                               |
| user                  |  references           | null:false  foreign_key: true            |


 ###association
 
 - belongs_to :purchases
 - belongs_to :user
 
 
##purchaseテーブル
| Culumn                | Type                  | Options                                  |
| --------------------- | --------------------- |----------------------------------------- |
| postal_code           |  string               | null:false                               |
| prefecture_id         |  integer              | null:false                               |
| municipality          |  string               | null:false                               |
| address  　　　   　　　|  string               | null:false                               |
| building_name         |  string               |                                          |


###association

-belongs_to :user
-belongs_to :item
-belongs_to :address


##addressesテーブル
| Culumn                | Type                  | Options                                  |
| --------------------- | --------------------- |----------------------------------------- |
| phone_number          |  string               | null:false                               |
| user                  |  references           | null:false    foreign_key: true          |
| item                  |  references           | null:false    foreign_key: true          |

###association
has_many :purchases




* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
