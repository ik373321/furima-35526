require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '新規登録時に必要な値が入っていれば登録できる' do
      expect(@user).to be_valid
    end


    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.last_name = '333333'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")

    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?

      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.first_name = '11111'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'last_name_kanaがフリガナが全角カナでなければ登録できない' do
      @user.last_name_kana = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'first_name_kanaがフリガナが全角カナでなければ登録できない' do
      @user.first_name_kana = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end


    it 'passwordが英語のみでは登録できない' do

      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it 'passwordが数字のみでは登録できない' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'password全角では登録できない' do
      @user.password = 'ａａａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordと確認用passwordが同じでなければ登録できない' do
      @user.password = 'a22222'
      @user.password_confirmation = 'a33333'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    
    it 'emailに@がなければ登録できない' do
      @user.password = 'aaaaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


  end
end