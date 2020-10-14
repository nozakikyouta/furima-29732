class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to:purchase

  with_options presence: true do
    validates :postal_code,format:{with:(/\A\d{3}[-]\d{4}\z/),message:""}
    validates :municipality
    validates :address
    validates :building_name
    validates :phone_number ,format:{with:/\A\d{11}\z/,message: ""}
  end
end
