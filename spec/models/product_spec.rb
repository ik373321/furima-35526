require 'rails_helper'

RSpec.describe Product, type: :model do
  
    describe 'ユーザー新規登録' do
      before do
        @product = FactoryBot.build(:product)
       @product.image = fixture_file_upload("/test_image.png")
      end
     context '商品出品がうまくいくとき' do
      it '商品出品に必要な値が入っていれば登録できる' do
        expect(@product).to be_valid
      end
     end
    
    context '商品出品がうまくいかないとき' do

      it 'nameが空では登録できない' do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'detailsが空では登録できない' do
        @product.details = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Details can't be blank")
      end

      it 'category_idが1では登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      
      it ' condition_idが1では登録できない' do
        @product. condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'ship_method_idが1では登録できない' do
        @product.ship_method_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Ship method must be other than 1")
      end

      it 'prefecture_idが1では登録できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it ' day_ship_id が1では登録できない' do
        @product.day_ship_id  = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Day ship must be other than 1")
      end

      it ' priceが空では登録できない' do
        @product.price  = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it ' priceが300以下では登録できない' do
        @product.price  = 5
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it ' priceが9999999以上では登録できない' do
        @product.price  = 999999999999999999
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it ' priceが半角数字以外では登録できない' do
        @product.price  = "aaaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end

      it ' detailsは４０字以上では登録できない' do
        @product.details  = "あああああああああああああああああああああああああああああああああああああああああ"
        @product.valid?
        expect(@product.errors.full_messages).to include("Details is too long (maximum is 40 characters)")
      end

      it ' imageがないと登録できない' do
        @product.image  = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

    end
  end


end
