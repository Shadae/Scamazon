FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  sequence :user_name do |n|
    "username#{n}"
  end

  factory :user do
    email
    user_name
    password "foobar"
    password_confirmation "foobar"
  end
end