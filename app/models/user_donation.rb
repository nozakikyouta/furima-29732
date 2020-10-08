class UserDonation
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:municipality,:address,:building_name,:phone_number,:purchase, :token
  with_options presence: true do
    validates :postal_code,format:{with:(/\A\d{3}[-]\d{4}\z/),message:" Input correctly"}
    validates :municipality
    validates :address
    validates :phone_number
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end
  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id,municipality: municipality, address: address, building_name:building_name,phone_number:phone_number, purchase:purchase )
    Purchase.create(item_id: item.id,user_id: user.id)
  end

end