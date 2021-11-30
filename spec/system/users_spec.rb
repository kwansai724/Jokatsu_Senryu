require 'rails_helper'

RSpec.describe "Users", type: :system do
  it "投稿者は川柳を投稿できること" do
    visit "/users"

    expect {
      select "女性パワーで未来を変えるの部", from: "user_posts_attributes_0_category"
      fill_in "user_posts_attributes_0_first_phrase", with: "あいうえお"
      fill_in "user_posts_attributes_0_second_phrase", with: "かきくけこさし"
      fill_in "user_posts_attributes_0_third_phrase", with: "たちつてと"
      fill_in "user_posts_attributes_0_pen_name", with: "テストペンネーム"
      fill_in "user_name", with: "テスト投稿者"
      choose "user_gender_男性", with: "男性"
      select "大阪府", from: "user_address"
      select "会社員", from: "myselectbox"
      select "30代", from: "user_age"
      fill_in "user_email", with: "test-user@email.com"
      fill_in "user_note", with: "テストメッセージ"
      check "user_questionary_wipメンバーのブログや投稿など"
      # save_and_open_page
      click_button "内容確認画面へ"
      expect(page).to have_content "確認画面"
    }.to change {
      current_path
    }.from(users_path).to(confirm_users_path)
  end

  # scenario "確認画面から投稿ができること" do
  #   visit "/users/confirm"

  #   expect {
  #     click_button "投稿する"
  #     expect(page).to have_content "ご応募ありがとうございました！"
  #   }.to change{ User.count }.by(1)

  # end
end
