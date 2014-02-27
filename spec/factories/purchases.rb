FactoryGirl.define do
  factory :purchase do
     first_name                 'davida'
     last_name                  'marion'
     email_address              'example@example.com'
     email_address_confirmation 'example@example.com'
     address1                   '123 whatever'
     city                       'somewhere'
     zip                        '12345'
     billing_first              'davida'
     billing_last               'marion'
     credit_card_number         '1234567890123456'
     cvv                        123
     billing_zip                '12345'
     billing_address1           '123 whatever'
     billing_city               'somewhere'
     state                      'wa'
     billing_state              'wa'
     expiration_date            412
  end
end