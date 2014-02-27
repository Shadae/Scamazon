FactoryGirl.define do
  factory :product do
    name 'product'
    description 'description'
    price 300
    retired false
    stock 100
    user
    weight 4.4
    length 1
    depth 4
    height 2
  end 
end

FactoryGirl.define do
  factory :product1, class: Product do
    name 'product1'
    description 'description'
    price 300
    retired false
    stock 100
    user
    weight 4.4
    length 1
    depth 4
    height 2
  end 
end