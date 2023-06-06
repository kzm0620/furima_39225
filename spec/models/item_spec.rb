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

      it '価格は半角数値のみ保存可能であること' do
        @item.item_price =  '1000'
        expect(@item).to be_valid
      end

    end  


    context '出品できないとき' do

      it '商品画像を1枚つけないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end


      it '商品名がないと保存できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end

      it '商品説明がないと保存できない' do
        @item.item_explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品説明を入力してください"
      end

      it 'カテゴリーの情報がないと保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      end

      it '商品の状態の情報がないと保存できない' do
        @item.situation_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態を入力してください"
      end

      it '配送料の負担の情報がないと保存できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担を入力してください"
      end

      it '発送元の地域の情報がないと保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を入力してください"
      end
    

      it '発送までの日数の情報がないと保存できない' do
        @item.delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を入力してください"
      end

      it '価格の情報がないと保存できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end


      it '価格は、¥300からしか保存できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は300以上の値にしてください"
      end

      it '価格は、¥99999999までしか保存できない' do
        @item.item_price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は9999999以下の値にしてください"
      end



      it '価格は半角数値でないと保存できない' do
        @item.item_price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は数値で入力してください"
      end

      it 'ユーザーが紐づいていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "ユーザーを入力してください"
      end

    end  

  end

end
