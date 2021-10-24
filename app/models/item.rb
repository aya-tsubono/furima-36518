class Item < ApplicationRecord

  validates :title, presence: true
  validates :text, presence: true
  validates :price, presence: true
  validates :user, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :days

  validates :category_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_id,  presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :area_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" } 
  validates :days_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" } 
end
