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

        with_options presence: true do
          validates :name
          validates :image
          validates :description_item
          validates :price,format: {with:/\A[0-9]+\z/,message: "out of setting range"}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999, message: "half-width number"}
        end
          validates :category_id, numericality:{ other_than: 0, message: "id Select"}
          validates :condition_id, numericality:{ other_than: 0, message: "id Select"}
          validates :schedule_item_id, numericality:{ other_than: 0, message:"id Select"}
          validates :prefecture_id, numericality:{ other_than: 0, message:"id Select"}
          validates :shopping_fee_id, numericality:{ other_than: 0,message: "id Select"}
end
