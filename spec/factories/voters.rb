FactoryBot.define do
  factory :voter do
    sequence(:name) { |n| "test-voter#{n}" }
    sequence(:email) { |n| "test-voter#{n}@email.com" }
    group "WIP"
    password "password"
  end
end
