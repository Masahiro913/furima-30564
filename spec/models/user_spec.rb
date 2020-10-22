require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまく行くとき" do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の半角英数字混合の時登録できる" do
        @user.password = "kjdgsfko324"
        @user.password_confirmation = "kjdgsfko324"
        expect(@user).to be_valid
      end

    end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user1 = FactoryBot.build(:user)
        @user1.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user1.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@が含まれないとき登録できない" do
        @user.email = "abc.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank","Password is invalid")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "kj354"
        @user.password_confirmation = "kj354"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank","Last name is invalid")
      end
      it "last_nameが半角の時登録できない" do
        @user.last_name = "kubo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank","First name is invalid")
      end
      it "first_nameが半角の時登録できない" do
        @user.first_name ="takehusa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_kanaが空の時登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank","Last name kana is invalid")
      end
      it "last_name_kanaが平仮名の時登録できない" do
        @user.last_name_kana = "久保"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "first_name_kanaが空の時登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "first_name_kanaが平仮名の時登録できない" do
        @user.first_name_kana = "建英"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end

  end
end