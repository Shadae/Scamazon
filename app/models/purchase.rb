class Purchase < ActiveRecord::Base
  before_validation :check_billing
  belongs_to :order
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, confirmation: true, format: { with: /\w+@\w+\.\w+/, message: "must be a valid email address"}
  validates :email_address_confirmation, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :zip, presence: true, format: {with: /\d{5}-?\d{4}?/, message: "must be a valid zip code"}
  validates :billing_first, presence: true
  validates :billing_last, presence: true
  validates :credit_card_number, presence: true, format: {with: /\d{4}-?\d{4}-?\d{4}-?\d{4}/}
  validates :cvv, presence: true, format: {with: /\d{3}/}
  validates :billing_zip, presence: true, format: {with: /\d{5}-?d{4}?/, message: "must be a valid zip code"}
  validates :billing_address1, presence: true
  validates :billing_city, presence: true
  validates :state, presence: true
  validates :billing_state, presence: true
  validates :expiration_date, presence: true, format: {with: /[1-12]\/[1-31]/}

  def check_billing
    if self.same_address?
       self.billing_first    = self.first_name
       self.billing_last     = self.last_name
       self.billing_address1 = self.address1
       self.billing_address2 = self.address2
       self.billing_city     = self.city
       self.billing_state    = self.state
       self.billing_zip      = self.zip
    end
  end

end

