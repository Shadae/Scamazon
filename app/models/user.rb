class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true, on: :create
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true
end
