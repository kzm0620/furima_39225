require 'rails_helper'

RSpec.describe Order, type: :model do
 
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do

    context '購入できるとき' do
      
      it '全ての値が問題なく入っている場合、購入ができる' do
        expect(@order).to be_valid
      end
      
      it '建物名は任意であること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end

    end

    context '購入できないとき' do

 
      it '郵便番号がないと購入できない' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "郵便番号を入力してください"
      end

      it '郵便番号は、「3桁ハイフン4桁」の半角文字列でないと保存できない' do
        @order.post_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include "郵便番号はハイフン(-)を含むこと"
      end

      it '都道府県がないと購入できない' do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include "都道府県は必須である"
      end

      it '市区町村がないと購入できない' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "市区町村を入力してください"
      end

      it '番地がないと購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "番地を入力してください"
      end

      it '電話番号がないと購入できない' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "電話番号を入力してください"
      end

      it '電話番号は、10桁以上の半角数値のみ保存可能なこと' do
        @order.telephone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include "電話番号は10桁以上11桁以内の半角数値のみ保存可能なこと"
      end

      it '電話番号は、11桁以内の半角数値のみ保存可能なこと' do
        @order.telephone_number = '123456789123'
        @order.valid?
        expect(@order.errors.full_messages).to include "電話番号は10桁以上11桁以内の半角数値のみ保存可能なこと"
      end

      it "トークンが空では登録できないこと" do
        @order.token =''
        @order.valid?
        expect(@order.errors.full_messages).to include("トークンを入力してください")
      end

      it "電話番号は、数字以外は保存できないこと" do
        @order.telephone_number = 'aaaaaaaa'
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は10桁以上11桁以内の半角数値のみ保存可能なこと")
      end

      it "ユーザーが紐づいていなければ保存できないこと" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("ユーザーを入力してください")
      end

      it "商品が紐づいていなければ保存できないこと" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("商品を入力してください")
      end
    end

  end 

end





