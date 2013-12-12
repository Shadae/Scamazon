class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true 
end
