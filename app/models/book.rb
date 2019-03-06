class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_one_attached :picture

  belongs_to :user
  has_many :sales

  validates_numericality_of :price,
  greater_than: 49, message: "must be at least 50 cents"
end
