FactoryBot.define do
  factory :voterpost do
    sequence(:favorite_post1) { |n| n }
    reason1 { "あ" * 1000 }
    sequence(:favorite_post2) { |n| n }
    reason2 { "あ" * 1000 }
    sequence(:favorite_post3) { |n| n }
    reason3 { "あ" * 1000 }
    sequence(:favorite_post4) { |n| n }
    reason4 { "あ" * 1000 }
    sequence(:favorite_post5) { |n| n }
    reason5 { "あ" * 1000 }
    sequence(:favorite_post6) { |n| n }
    reason6 { "あ" * 1000 }
    sequence(:favorite_post7) { |n| n }
    reason7 { "あ" * 1000 }
    sequence(:favorite_post8) { |n| n }
    reason8 { "あ" * 1000 }
    sequence(:favorite_post9) { |n| n }
    reason9 { "あ" * 1000 }
    sequence(:favorite_post10) { |n| n }
    reason10 { "あ" * 1000 }
    sequence(:favorite_post11) { |n| n }
    reason11 { "あ" * 1000 }
    association :voter

    # 推薦理由が文字数オーバー
    trait :over_number_of_characters do
      reason1 { "あ" * 1001 }
      reason2 { "あ" * 1001 }
      reason3 { "あ" * 1001 }
      reason4 { "あ" * 1001 }
      reason5 { "あ" * 1001 }
      reason6 { "あ" * 1001 }
      reason7 { "あ" * 1001 }
      reason8 { "あ" * 1001 }
      reason9 { "あ" * 1001 }
      reason10 { "あ" * 1001 }
      reason11 { "あ" * 1001 }
    end

    # 空のvoterpost
    trait :empty_voterpost do
      favorite_post1 { "" }
      reason1 { "" }
      favorite_post2 { "" }
      reason2 { "" }
      favorite_post3 { "" }
      reason3 { "" }
      favorite_post4 { "" }
      reason4 { "" }
      favorite_post5 { "" }
      reason5 { "" }
      favorite_post6 { "" }
      reason6 { "" }
      favorite_post7 { "" }
      reason7 { "" }
      favorite_post8 { "" }
      reason8 { "" }
      favorite_post9 { "" }
      reason9 { "" }
      favorite_post10 { "" }
      reason10 { "" }
      favorite_post11 { "" }
      reason11 { "" }
    end
  end
end
