require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
   describe "ユーザー新規登録" do

    context '登録できる場合' do
     it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、生年月日が存在すれば登録できる' do
      expect(@user).to be_valid
     end
    end

    context '登録できない場合' do
     it "nicknameが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailは重複して登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).tp include('Email has already been taken')
     end
     it "emailに＠が含まれていないと登録できない" do
      @user.email = 'mail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email doesn't have @")
     end
     it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordが5文字以下では登録できない" do
      @user.password = 'abab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password must have 6characters")
     end
     it "passwordは英字だけでは登録できない" do
      @user.password = 'ababab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password must have number")
     end
     it "passwordが数字だけでは登録できない" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password must have alphabet")
     end
     it "passwordとconfirmationが一致していないと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")    
     end
     it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
     end
     it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
     end
     it "first_nameが漢字・ひらがな・カタカナ以外だと登録できない" do
      @user.first_name = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname must be Japanese")
     end
     it "last_nameが漢字・ひらがな・カタカナ以外だと登録できない" do
      @user.last_name = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname must be Japanese")
     end
     it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname_kana can't be blank")
     end
     it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname_kana can't be blank")
     end
     it "last_name_kanaがカタカナ以外だと登録できない" do
      @user.first_name_kana = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname_kana must be Katakana")
     end
     it "last_name_kanaがカタカナ以外だと登録できない" do
      @user.last_name_kana = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname_kana must be Katakana")
     end
     it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
    end

   end

 end