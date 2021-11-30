FactoryBot.define do
  factory :like do
    association :post
    association :voter
  end
end
