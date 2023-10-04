FactoryBot.define do
  factory :answer do
    sequence :body do |n|
      "MyAnswerText#{n}"
    end

    correct { false }
    question
  end
end
