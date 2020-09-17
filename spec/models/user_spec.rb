require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、password,first_nameとlast_name,first_name_kanaとlast_name_kana,birthdayが存在すれば登録できる" do
        expect (@user).to be_valid
      end
      it "nicknameがあれば登録できる" do
        
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる" do
        @user.password ="a1a1a1"
        expect(@user).to be_valid
      end
      it "passwordが確認用を含めて２回入力すれば登録できる" do
        @user.password = ""
      end
      it "emailに＠があれば登録できる" do
      end
      it "fiirst-nameが全角であれば登録できる" do
      end
      it "last-nameが全角であれば登録できる" do
      end
      it "fiirst-name_kanaが全角カナであれば登録できる" do
      end
      it "last-name_kanaが全角カナであれば登録できる" do
      end
      it "birthdayが日付であれば登録できる" do
      end
      
      
      
      

      
 