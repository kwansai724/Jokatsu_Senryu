FactoryBot.define do
  factory :staff do
    # sequence(:login_id) { |n| "1234567#{n}" }
    login_id "12345678"
    password "password"
    group_name "WIP"
    category_name "輝け❣️私のライフスタイルの部"

    # login_idの文字数が７文字
    trait :under_of_login_id do
      sequence(:login_id) { |n| "123456#{n}" }
    end

    # login_idの文字数が９文字
    trait :over_of_login_id do
      sequence(:login_id) { |n| "12345678#{n}" }
    end
  end
end
