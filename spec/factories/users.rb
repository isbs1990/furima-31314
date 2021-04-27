FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    knj_first_name { '石橋' }
    knj_last_name { '洋和' }
    kana_first_name { 'イシバシ' }
    kana_last_name { 'ヒロカズ' }
    birth_day { '2000-01-01' }
    email                 {Faker::Internet.free_email}
    password              {'sample123'}
    password_confirmation {password}
  end
end