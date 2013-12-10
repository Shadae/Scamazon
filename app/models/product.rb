class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validate :price, presence: true
end
