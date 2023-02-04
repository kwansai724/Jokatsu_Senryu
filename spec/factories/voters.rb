FactoryBot.define do
  factory :voter do
    sequence(:name) { |n| "test-voter#{n}" }
    sequence(:email) { |n| "test-voter#{n}@email.com" }
    group "WIP"
    password "password"
  end

  trait :with_likes_for_voter do
    after(:create) { |voter| create_list(:like, 5, voter: voter) }
  end
end
