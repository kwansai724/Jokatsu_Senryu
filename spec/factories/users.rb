FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "test-user#{n}" }
    sequence(:email) { |n| "test-user#{n}@email.com" }
    gender "男性"
    address "大阪"
    profession "会社員"
    age "32"
    questionary "WIPメンバーのブログや投稿など"
  end

  trait :with_posts do
    after(:create) { |user| create_list(:post, 2, user: user) }
  end
end
