FactoryBot.define do
  factory :item do
    name { 'スーツ' }
    description { Faker::Lorem.sentence }
    detailcategory_id { 2 }
    detailstatus_id { 2 }
    pref_id { 2 }
    deliverycost_id { 2 }
    deliveryday_id { 2 }
    price {500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
