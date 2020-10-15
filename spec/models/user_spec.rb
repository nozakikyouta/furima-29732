require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname、email、password、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'a1a1a1'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合であれば登録できる' do
        @user.password = 'a1a1a1'
        expect(@user).to be_valid
      end
      it 'passwordが確認用を含めて２回入力すれば登録できる' do
        @user.password = 'a1a1a1'
        expect(@user).to be_valid
      end

      it 'fiirst_nameが全角であれば登録できる' do
        @user.first_name = 'あああ'
        expect(@user).to be_valid
      end
      it 'last-nameが全角であれば登録できる' do
        @user.last_name = 'あああ'
        expect(@user).to be_valid
      end
      it 'fiirst_name_kanaが全角カナであれば登録できる' do
        @user.first_name_kana = 'アアア'
        expect(@user).to be_valid
      end
      it 'last-name_kanaが全角カナであれば登録できる' do
        @user.last_name_kana = 'アアア'
        expect(@user).to be_valid
      end
      it 'birthdayが日付であれば登録できる' do
        @user.birthday = '1998-12-10'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに数字のみを入力した時も登録できない' do
        @user.password = 111111
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '@が含まれない時に登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordに英字と数字の両方を含めないと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが全角じゃないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'last_nameが全角じゃないと登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'first_name_kanaが半角と全角ひらがなでは登録できない' do
        @user.first_name_kana = 'aあ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end
      it 'Last_name_kanaは半角と全角ひらがな漢字では登録できない' do
        @user.last_name_kana = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end
    end
  end
end
