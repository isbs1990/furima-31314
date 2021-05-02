class Item < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :deliverycost
  belongs_to :deliveryday
  
  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price,numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 1 } do
    validates :detail_category_id
    validates :detail_status_id
    validates :pref_id
    validates :deliverycost_id
    validates :deliveryday_id
  end
  end