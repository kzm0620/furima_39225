require 'rails_helper'

RSpec.describe Item, type: :model do
 
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '出品できるとき' do
      
      it '全ての値が問題なく入っている場合、出品ができる' do
        expect(@item).to be_valid
      end

    end  


    context '出品できないとき' do

      it '商品画像を1枚つけないと保存できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item image can't be blank"
      end


      it '商品名がないと保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end

      it '商品説明がないと保存できない' do
        @item.item_explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item explanation can't be blank"
      end

      it 'カテゴリーの情報がないと保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態の情報がないと保存できない' do
        @item.item_situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item situation can't be blank"
      end

      it '配送料の負担の情報がないと保存できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charge can't be blank"
      end

      it '発送元の地域の情報がないと保存できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
    

      it '発送までの日数の情報がないと保存できない' do
        @item.days_to_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to delivery can't be blank"
      end

      it '価格の情報がないと保存できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price can't be blank"
      end


      it '価格は、¥300からしか保存できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be greater than or equal to 300"
      end

      it '価格は、¥99999999までしか保存できない' do
        @item.item_price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Item price must be less than or equal to 9999999"
      end



      it '価格は半角数値のみ保存可能であること' do
        @item = FactoryBot.build(:item, item_price: '1000')
        expect(@item).to be_valid
      end

      
    
    end

  end

end