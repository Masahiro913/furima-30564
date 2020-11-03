require 'rails_helper'

RSpec.describe DealAddressForm, type: :model do
  before do
    @dealAddressForm = FactoryBot.build(:deal_address_form)
  end

  it "全ての値が入力されていれば購入できる" do
    expect(@dealAddressForm).to be_valid
  end
  it "建物名が入力されていなくても購入できる" do
    expect(@dealAddressForm).to be_valid
  end
  it "郵便番号が入力されていないと購入できない" do
    @dealAddressForm.post_number = ""
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("Post number can't be blank")
  end
  it "郵便番号にハイフンが含まれていないと購入できない" do
    @dealAddressForm.post_number = "2343445"
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("Post number is invalid. Include hyphen(-)")
  end
  it "都道府県が入力されていないと購入できない" do
    @dealAddressForm.prefecture_id = ""
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("Prefecture can't be blank")
  end
  it "都道府県がデフォルトの時購入できない" do
    @dealAddressForm.prefecture_id = 1
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("Prefecture must be greater than or equal to 2")
  end
  it "市区町村が選択されていないと購入できない" do
    @dealAddressForm.city_town = ""
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("City town can't be blank")
  end
  it "番地が入力されていないと購入できない" do
    @dealAddressForm.addressline = ""
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("Addressline can't be blank")
  end
  it "電話番号が入力されていないと購入できない" do
    @dealAddressForm.tell_buyer = ""
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("Tell buyer can't be blank")
  end
  it "電話番号が12桁以上だと購入できない" do
    @dealAddressForm.tell_buyer = "090465738495"
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("Tell buyer is too long (maximum is 11 characters)")
  end
  it "tokenが空では保存できない" do
    @dealAddressForm.token = ""
    @dealAddressForm.valid?
    expect(@dealAddressForm.errors.full_messages).to include ("Token can't be blank")
  end
end
