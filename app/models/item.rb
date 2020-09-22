class Item < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
