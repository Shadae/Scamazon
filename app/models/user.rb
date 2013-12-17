class User < ActiveRecord::Base
  has_secure_password
  has_many :products
  validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :email, confirmation: true, format: { with: /.+@(\w+\.)+\w+/, message: "Must enter a valid email address."}
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true 
end
