class Purchases 
  belongs_to :order
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, confirmation: true, format: { with: /\w+@\w+\.\w+/, message: "Must be a valid email address"}
  validates :email_address_confirmation, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :zip, presence: true, format: {with: /\d{5}-?\d{4}?/, message: "Must be a valid zip code"}
  validates :billing_first, presence: true
  validates :billing_last, presence: true
  validates :credit_card_number, presence: true, format: {with: /\d{4}-?\d{4}-?\d{4}-?\d{4}/}
  validates :cvv, presence: true, format: {with: /\d{3}/}
  validates :billing_zip, presence: true, format: {with: /\d{5}-?d{4}?/, message: "Must be a valid zip code"}
  validates :billing_address1, presence: true
  validates :billing_city, presence: true
  validates :state, presence: true
  validates :billing_state, presence: true
end