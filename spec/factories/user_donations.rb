FactoryBot.define do
  factory :user_donation do
    postal_code   {"111-2981"}
    prefecture_id { 1 }
    municipality  {"as"}
    address       {"aaa"}
    building_name {"aaa"}
    phone_number  {99991111111}
    purchase      {"a"}
    token         { 1 }
  end
end