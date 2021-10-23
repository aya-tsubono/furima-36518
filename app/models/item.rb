class Item < ApplicationRecord

  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_fee_id, presence: true
  validates :area_id, presence: true
  validates :days, presence: true
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition



end
