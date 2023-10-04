FactoryBot.define do
  factory :answer do
    sequence :body do |n|
      "MyAnswerText#{n}"
    end

    correct { false }
    question

    trait :fake do
      body { nil }
    end
  end
end
