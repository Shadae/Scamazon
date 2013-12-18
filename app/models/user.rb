class User < ActiveRecord::Base
  has_secure_password
  has_many :products
  has_many :orders
  has_many :reviews
  validates :email, presence: true, uniqueness: { case_sensitive: false }, on: :create
  validates :email, confirmation: true, format: { with: /.+@(\w+\.)+\w+/, message: "Must enter a valid email address."}
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true 


  def self.seller
    Product.all.map {|product| product.user_id }.map {|user_id| User.find(user_id)}.uniq
    # We want to find users that have at least one product.
  end

end
