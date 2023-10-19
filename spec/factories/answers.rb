FactoryBot.define do
  sequence :body do |n|
    "MyAnswerText#{n}"
  end

  factory :answer do
    body
    correct { false }
    question
    association :author

    trait :fake do
      body { nil }
    end
  end
end
