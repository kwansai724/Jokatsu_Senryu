FactoryBot.define do
  factory :post do
    sequence(:first_phrase) { |n| "あいうえお#{n}" }
    sequence(:second_phrase) { |n| "かきくけこさし#{n}" }
    sequence(:third_phrase) { |n| "たちつてと#{n}" }
    sequence(:pen_name) { |n| "post_name#{n}" }
    category { "女性パワーで未来を変えるの部" }
    sequence(:user_id) { |n| n }
    association :user
  end

  trait :with_likes_for_post do
    after(:create) { |post| create_list(:like, 5, post: post) }
  end
end
