require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  describe 'create' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_buyer = FactoryBot.build(:order_buyer, user_id:user.id, item_id:item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it '全ての値があれば登録できること' do
        expect(@order_buyer).to be_valid
      end

      it 'buydeliverybldがなくても登録できること' do
        @order_buyer.buydeliverybld = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'buydeliveryaddressがなければ登録できないこと' do
        @order_buyer.buydeliveryaddress = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buydeliveryaddress can't be blank")
      end

      it 'buydeliveryaddressにはハイフンが必要であること' do
        @order_buyer.buydeliveryaddress = '11111111'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Buydeliveryaddress はハイフンをつけて入力してください')
      end

      it 'buydeliverycityがなければ登録できないこと' do
        @order_buyer.buydeliverycity = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buydeliverycity can't be blank")
      end

      it 'buydeliverynumがなければ登録できないこと' do
        @order_buyer.buydeliverynum = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buydeliverynum can't be blank")
      end

      it 'buytellnumがなければ登録できないこと' do
        @order_buyer.buytellnum = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buytellnum can't be blank")
      end

      it 'buytellnumにハイフンは不要であること' do
        @order_buyer.buytellnum = '123-4567-8901'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buytellnum はハイフンなし、 かつ１２桁以上では登録できません")
      end

      it 'buytellnumは１２桁以上では登録できないこと' do
        @order_buyer.buytellnum = '1234567890123'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buytellnum はハイフンなし、 かつ１２桁以上では登録できません")
      end


      it 'buytellnumは英字のみでは登録できないこと' do
        @order_buyer.buytellnum = 'abcdefghijkl'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buytellnum はハイフンなし、 かつ１２桁以上では登録できません")
      end

      it 'buytellnumは英数字混合では登録できないこと' do
        @order_buyer.buytellnum = '123456abcdef'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buytellnum はハイフンなし、 かつ１２桁以上では登録できません")
      end

      it 'buytellnumは全角数字では登録できないこと' do
        @order_buyer.buytellnum = '１２３４５６７８９０１２'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Buytellnum はハイフンなし、 かつ１２桁以上では登録できません")
      end

      it 'pref_idがなければ登録できないこと' do
        @order_buyer.pref_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include('Pref must be other than 1')
      end

      it 'tokenが空では登録できないこと' do
        @order_buyer.token = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @order_buyer.user_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では登録できないこと' do
        @order_buyer.item_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
