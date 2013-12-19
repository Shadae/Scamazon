class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :stock, presence: true
  validates :stock, numericality: { greater_than: -1 }

  mount_uploader :image, ImageUploader
  
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :categories, through: :category_products
  has_many :category_products
  has_many :reviews
  belongs_to :user

  scope :by_category, lambda {|ids| includes(:categories).where(categories: {id: ids}) }
  scope :by_seller, lambda {|ids| where(user_id: ids) }

  def self.filter(category=nil,seller=nil,search=nil)
    @filter = [category,seller,search].flatten
    if category && seller
      by_category(category).by_seller(seller)
    elsif category
      by_category(category)
    elsif seller
      by_seller(seller)   
    elsif search
      includes(:categories).where("(categories.category) LIKE :s OR (products.name) LIKE :s OR (products.description) LIKE :s", s: "%#{search.downcase}%")
    else
      where(retired: false)
    end
  end


    
      # this is the original, clunky code that does the same thing, but made it so some scammer could game the system. Which is true to the philosophy of Scamazon, to be fair.
      # filter_term.map {|search_term| includes(:categories,:users).where('categories.category LIKE :s AND users.user_name LIKE :s', s: "%#{search_term}%") }.inject(:&)   


end
