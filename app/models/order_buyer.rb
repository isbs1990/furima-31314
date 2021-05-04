class OrderBuyer
  include ActiveModel::Model
  attr_accessor :buydeliveryaddress, :buydeliverycity, :buydeliverynum, :buytellnum, :pref_id, :buydeliverybld, :token, :user_id, :item_id

  with_options presence: true do
    validates :buydeliveryaddress, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンをつけて入力してください' }
    validates :buydeliverycity
    validates :buydeliverynum
    validates :buytellnum, format: { with: /\A\d{10,11}\z/, message: 'はハイフンなし、 かつ１２桁以上では登録できません' }
    validates :buytellnum, format: { with: /\A[0-9]+\z/i, message: '半角数字以外では登録できません' }
    validates :pref_id, numericality: { other_than: 1 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(buydeliveryaddress: buydeliveryaddress, pref_id: pref_id, buydeliverycity: buydeliverycity, buydeliverynum: buydeliverynum,
      buytellnum: buytellnum, buydeliverybld: buydeliverybld, order_id: order.id)
  end


end