FactoryBot.define do
  factory :buying_history_address do
    postcode { '123-4567' }
    area_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Gimei.address.city.kanji }
    addresses { Gimei.address.town.kanji }
    building { '田中ビル１０１' }
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    user_id { 1 }
    item_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
