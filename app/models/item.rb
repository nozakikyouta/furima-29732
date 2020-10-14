class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule_item
  belongs_to_active_hash :shopping_fee
 
  
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
    validates :name
    validates :image
    validates :description_item
    validates :price, format: {with: /\A[0-9]+\z/, message: 'out of setting range'}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99_999_999, message: 'half-width number'}
  end
    with_options numericality: {other_than: 0, message: 'id Select'} do
    validates :category_id
    validates :condition_id
    validates :schedule_item_id
    validates :prefecture_id
    validates :shopping_fee_id
  end
end
