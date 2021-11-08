class BuyingHistoryAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postcode, :prefectures, :municipality, :addresses, :building, :phone_number, :buying_history
  
    validates :postcode,       presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality,   presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :addresses,      presence: true
    validates :phone_number,   presence: true
    validates :buying_history, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefectures
  validates :prefectures_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buying_history = BuyingHistory.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, prefectures: prefectures, municipality: municipality, addresses: addresses, building: building, phone_number: phone_number, buying_history_id: buying_history.id)
  end

end