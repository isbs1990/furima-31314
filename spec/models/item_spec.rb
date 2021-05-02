require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての項目が存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameがなければ登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'detailcategory_idが空では登録できないこと' do
      @item.detailcategory_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detailcategory is not a number")
    end

    it 'categoryの1を選択すると登録できないこと' do
      @item.detailcategory_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Detailcategory must be other than 1')
    end

    it 'statusが空では登録できないこと' do
      @item.detailstatus_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detailstatus is not a number")
    end

    it 'statusの1を選択すると登録できないこと' do
      @item.detailstatus_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Detailstatus must be other than 1")
    end

    it 'DeliveryCostがなければ登録できないこと' do
      @item.deliverycost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Deliverycost is not a number')
    end

    it 'DeliveryCostの1を選択すると登録できないこと' do
      @item.deliverycost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliverycost must be other than 1")
    end

    it 'prefが数字でなければ登録できないこと' do
      @item.pref_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Pref is not a number')
    end

    it 'prefの1を選択すると登録できないこと' do
      @item.pref_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Pref must be other than 1')
    end

    it 'DeliveryDayがなければ登録できないこと' do
      @item.deliveryday_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('Deliveryday is not a number')
    end

    it 'DeliveryDayの1を選択すると登録できないこと' do
      @item.deliveryday_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Deliveryday must be other than 1')
    end

    it 'priceがなければ登録できないこと' do
      @item.price = ''
      @item.valid?
      # expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが、¥299以下だと登録できないこと' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが、¥10,000,000以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceは半角数字でなければ登録できないこと' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceは全角文字では登録できないこと' do
      @item.price = '１１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'priceは英数字混合では登録できないこと' do
      @item.price = 'aaa111'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
