class BuyingHistoryAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefectures, :municipality, :addresses, :building, :phone_number, :buying_history
end