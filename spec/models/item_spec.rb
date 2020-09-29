require 'rails_helper'
  describe Item, type: :model do
      before do
        @item = FactoryBot.build(:item)
      end

    describe '出品' do
      context '出品がうまくいくとき' do
        it "'すべての値が正しく入力すれば登録できる" do
          expect(@item).to be_valid
        end
        it "商品の説明が必須であること" do
          @item.description_item = "あ"
          expect(@item).to be_valid
        end
        it "商品名があれば出品できる" do
          @item.name = "a"
          expect(@item).to be_valid
        end
        it "カテゴリーがあれば出品できる" do
          @item.category_id = 1
          expect(@item).to be_valid
        end
        it "商品の状態があれば出品できる" do
          @item.condition_id = 1
          expect(@item).to be_valid
        end
        it "配送料の負担があれば出品できる" do
          @item.shopping_fee_id = 1
          expect(@item).to be_valid
        end
        it "発送元の地域があれば出品できる" do
          @item.prefecture_id = 1
          expect(@item).to be_valid
        end
        it "発送までの日数があれば出品できる" do
          @item.schedule_item_id = 1
          expect(@item).to be_valid
        end
        it "価格があれば出品できる" do
          @item.price = 3000
          expect(@item).to be_valid
        end
        it "販売価格が半角数字のみ出品できる" do
          @item.price = 3000
          expect(@item).to be_valid
        end
        it "価格の範囲が300~99999999であれば出品できる" do
          @item.price = 6000000
          expect(@item).to be_valid
        end
      end
        context '出品がうまくいかないとき' do
          it "商品の説明が空だと登録できない" do
            @item.description_item = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Description item can't be blank")
          end
          it "商品名が空だと登録できない" do
              @item.name = ''
              @item.valid?
              expect(@item.errors.full_messages).to include("Name can't be blank")
          end
          it "カテゴリーの情報が空だと登録できない" do
            @item.category_id = 0
            @item.valid?
            expect(@item.errors.full_messages).to include("Category id Select")
          end
          it "商品の状態が空だと登録できない" do
            @item.condition_id = 0
            @item.valid?
            expect(@item.errors.full_messages).to include("Condition id Select")
          end
          it "配送料の負担が空だと登録できない" do
            @item.shopping_fee_id = 0
            @item.valid?
            expect(@item.errors.full_messages).to include("Shopping fee id Select")
          end
          it "発送元の地域が空だと登録できない" do
            @item.prefecture_id = 0
            @item.valid?
            expect(@item.errors.full_messages).to include("Prefecture id Select")
          end
          it "発送までの日数が空だと登録できない" do
            @item.schedule_item_id = 0
            @item.valid?
            expect(@item.errors.full_messages).to include("Schedule item id Select")
          end
          it "価格が空だと登録できない" do
            @item.price = []
            @item.valid?
            expect(@item.errors.full_messages).to include("Price can't be blank")
          end
          it "販売価格が全角登録できない" do
            @item.price = '３００'
            @item.valid?
            expect(@item.errors.full_messages).to include("Price half-width number")
          end
          it "価格の範囲が３００〜９９９９９９９９以外だと登録できない" do
            @item.price = 200
            @item.valid?
            expect(@item.errors.full_messages).to include("Price half-width number")
          end
        end
    end
  end
    
