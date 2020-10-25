require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/flag.png")
  end

  describe "商品の出品" do

    context "商品出品がうまく行く時" do
      it "画像、商品名、価格、商品説明、カテゴリー、商品状態、配送料の負担、発送元の地域、発送までの日数が入力されていれば商品を出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品がうまくいかない時" do
      it "商品名が空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品画像がないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品説明が空だと出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "価格が空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is not a number", "Price is invalid")
      end
      it "価格が300未満だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が9999999以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "カテゴリーを選択していないと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "カテゴリーがデフォルトであるcategory_id=1を選択している時出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be greater than or equal to 2")
      end
      it "商品状態を選択してないと出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "商品状態がデフォルトであるstatus_id=1を選択している時出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be greater than or equal to 2")
      end
      it "配送料の負担を選択していないと出品できない" do
        @item.deal_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deal fee can't be blank")
      end
      it "配送料の負担がデフォルトであるstatus_id=1を選択していると出品できない" do
        @item.deal_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Deal fee must be greater than or equal to 2")
      end
      it "発送元の地域を選択していないと出品できない" do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送元の地域がデフォルトであるprefecture_id=1を選択していると出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be greater than or equal to 2")
      end
      it "発送までの日数を選択していないと出品できない" do
        @item.delivery_period_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery period can't be blank")
      end
      it "発送までの日数がデフォルトであるdelivery_period_id=1を選択していると出品できない" do
        @item.delivery_period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery period must be greater than or equal to 2")
      end
    end
  end 
end
