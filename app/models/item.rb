class Item < ApplicationRecord

  validates :title, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :days_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :area, :days


end
