FactoryBot.define do
  factory :buying_history_address do
    postcode { '123-4567' }
    area_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Gimei.address.city.kanji }
    addresses { Gimei.address.town.kanji }
    building { '田中ビル１０１' }
    phone_number { Faker::PhoneNumber.cell_phone }
    association :buying_history
    association :user
    association :Item
  end
end
