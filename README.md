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

# Designing Database

## users table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false, minimum: 7|
### Association
- has_many :items
- has_many :comments
- has_one :credit_card
- has_one :user_profile
- has_one :user_address

## credit_cards table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
### Association
- belongs_to :user

## user_profiles table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|introduction|text||
|image|string||
### Association
- belongs_to :user

## user_addresses table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|postcode|integer|null: false, limit: 7|
|prefecture_code|integer|null: false, jp_prefecture|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|integer|null: false, unique: true|
### Association
- belongs_to :user

## items table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|postage_burden_id|integer|null: false, foreign_key: true|
|prefecture_code|integer|null: false, jp_prefecture|
|size_id|integer|null: false, foreign_key: true|
|postage_days_id|integer|null: false, foreign_key: true|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|deal_done_date|datetime||
### Association
- has_many :comments, dependent: destroy
- has_many :item_images, dependent: destroy
- belongs_to :category
- belongs_to :brand
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_burden
- belongs_to_active_hash :item_size
- belongs_to_active_hash :postage_day
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many :items

## brands table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## item_conditions table (activehash)
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
### Association
- has_many :items

## postage_burdens table (activehash)
|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|
### Association
- has_many :items

## item_sizes table (activehash)
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :items

## postage_days table (activehash)
|Column|Type|Options|
|------|----|-------|
|day|string|null: false|
### Association
- has_many :items

## item_images table
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|image|string|null: false|
### Association
- belongs_to :item

## comments table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comment|text|null: false|
### Association
- belongs_to :user
- belongs_to :item

