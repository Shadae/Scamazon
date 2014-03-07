FactoryGirl.define do
  factory :order_item do
    product
    order
    quantity 8
  end
end
