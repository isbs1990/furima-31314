FactoryBot.define do
  factory :order_buyer do
    buydeliveryaddress { '123-4567' }
    buydeliverycity { Faker::Lorem.sentence }
    buydeliverynum { '港区六本木6-10-1' }
    buytellnum { '09012345678' }
    pref_id { 2 }
    token { 'tok_abcdefghijk00000000000000000' }
    buydeliverybld { '六本木ヒルズ' }
  end
end