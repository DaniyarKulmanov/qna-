FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    email
    password { '12345678' }
    password_confirmation { '12345678' }
  end

  trait :fake do
    email { 'wrong_email@test.com' }
    password { '111111111' }
    password_confirmation { '111111111' }
  end
end
