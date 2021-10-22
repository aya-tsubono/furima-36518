class Item < ApplicationRecord

  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :area_id, presence: true
  validates :days, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
