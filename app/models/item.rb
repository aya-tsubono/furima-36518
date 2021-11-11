class Item < ApplicationRecord
  belongs_to :user
  has_one :buying_history
  has_one_attached :image
  validates :title, presence: true, length: { maximum: 40 }
  validates :text,  presence: true, length: { maximum: 1000 }
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days

  validates :category_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_fee_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_id,          presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
