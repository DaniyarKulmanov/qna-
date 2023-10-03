FactoryBot.define do
  factory :question do
    title { "MyString" }
    body { "MyText" }

    trait :fake do
      title { nil }
      body { nil }
    end
  end
end
