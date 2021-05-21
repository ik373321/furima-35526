require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入機能' do
    before do
      @order = FactoryBot.build(:order)
    end
    context '商品購入がうまくいくとき' do
      it '商品購入に必要な値が入っていれば登録できる' do
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it '郵便番号が空では登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが使われていないと登録できない' do
        @order.postal_code = '2222222'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'tokenが空では登録できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'prefectureが空では登録できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'blockが空では登録できない' do
        @order.block = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Block can't be blank")
      end

      it 'mobileが空では登録できない' do
        @order.mobile = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Mobile can't be blank")
      end
      it 'mobileが１１字以下でないと登録できない' do
        @order.mobile = '123456789123'
        @order.valid?
        expect(@order.errors.full_messages).to include("Mobile is invalid")
      end

      it 'mobileが数字でないと登録できない' do
        @order.mobile = 'aaaaaaaaaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include("Mobile is invalid")
      end




    end


  end

end