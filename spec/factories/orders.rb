FactoryGirl.define do
  factory :order do
    status "pending"
    session_id "24"
    shipping_code "4439"
    user
    purchase_id 5
  end
end

