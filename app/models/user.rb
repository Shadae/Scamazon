class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, on: :create
  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
