class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  mount_uploader :image, ImageUploader
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :categories, through: :category_products
  has_many :category_products
  has_one :user, through: :merchant_product
  has_one :merchant_product
end
