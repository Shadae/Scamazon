class User < ActiveRecord::Base
  has_secure_password
  has_many :products, through: :merchant_products
  has_many :merchant_products
  validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true 

