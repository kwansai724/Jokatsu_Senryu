require 'rails_helper'

RSpec.describe Post, type: :model do
  it "上の句の文字数上限は３０文字であること" do
    post = build(:post, first_phrase: "あ" * 31)
    post.valid?
    expect(post.errors[:first_phrase]).to include("は30文字以内で入力してください")
  end

  it "中の句の文字数上限は３０文字であること" do
    post = build(:post, second_phrase: "あ" * 31)
    post.valid?
    expect(post.errors[:second_phrase]).to include("は30文字以内で入力してください")
  end

  it "下の句の文字数上限は３０文字であること" do
    post = build(:post, third_phrase: "あ" * 31)
    post.valid?
    expect(post.errors[:third_phrase]).to include("は30文字以内で入力してください")
  end

  it "ペンネームの文字数上限は５０文字であること" do
    post = build(:post, pen_name: "あ" * 51)
    post.valid?
    expect(post.errors[:pen_name]).to include("は50文字以内で入力してください")
  end

  it "上の句の入力があれば、部門の選択が必須であること" do
    post = build(:post, category: nil)
    post.category_valid
    expect(post.errors[:category]).to include("を入力してください")
  end

  it "Userが存在しなければPostは無効であること" do
    post = build(:post, user_id: nil)
    expect(post).to_not be_valid
  end

  it "１つの投稿に複数の投票ができること" do
    post = create(:post, :with_likes_for_post)
    expect(post.likes.length).to eq 5
  end
end
