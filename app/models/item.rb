class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to_active_hash :category
         belongs_to_active_hash :condition
         belongs_to_active_hash :prefecture
         belongs_to_active_hash :schedule_item
         belongs_to_active_hash :shopping_fee

         validates :category, presence: true
         validates :condition, presence: true
         validates :prefecture, presence: true
         validates :schedule_item, presence: true
         validates :shopping_fee, presence: true
         validates :category, numericality: { other_than: 0 }
         validates :condition, numericality: { other_than: 0 } 
         validates :prefecture, numericality: { other_than: 0 }
         validates :schedule_item, numericality: { other_than: 0 }
         validates :shopping_fee, numericality: { other_than: 0 }

         belongs_to :user
         has_one_attached :image

        with_options presence: true do
          validates :name
          validates :category_id
          validates :condition_id
          validates :description_item
          validates :price
          validates :schdule_item_id
          validates :prefecture_id
          validates :shopping_fee_id
          validates :user
        end
end
