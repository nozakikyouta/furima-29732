require 'rails_helper'
  describe UserDonation, type: :model do
  before do
    @user_donation = FactoryBot.build(:user_donation)
  end

 describe '購入' do
   context '購入がうまくいく時' do
     	it "すべての値が正しく入力すれば購入できる" do
        expect(@user_donation).to be_valid
      end
      it "建物番号がない時でも購入がうまくいく" do
        expect(@user_donation).to be_valid
      end
    end
    context'購入ができないとき' do
      it '郵便番号が空だと購入できない' do
        @user_donation.postal_code  = " "
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Postal code can't be blank")
      end
      it "都道府県が空だと購入できない" do
        @user_donation.prefecture_id = 0
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Prefecture id Select")
      end
      it "市区町村が空だと購入できない" do
         @user_donation.municipality =" " 
         @user_donation.valid?
         expect(@user_donation.errors.full_messages).to include("Municipality can't be blank")
      end
      it "番地が空だと購入できない" do
          @user_donation.address = " "
          @user_donation.valid?
          expect(@user_donation.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空だと購入できない" do
          @user_donation.phone_number= " "
          @user_donation.valid?
          expect(@user_donation.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号がハイフンがあり１１桁異常だと購入できない"do
          @user_donation.phone_number = "0900-9009-0090"
          @user_donation.valid?
          expect(@user_donation.errors.full_messages).to include("Phone number is invalid")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @user_donation.postal_code = "1112222"
        @user_donation.valid?
        expect(@user_donation.errors.full_messages).to include("Postal code  Input correctly")
      end
      it 'クレジットカード情報の入力がないと購入できない'do
          @user_donation.token  = " "
          @user_donation.valid?
          expect(@user_donation.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
