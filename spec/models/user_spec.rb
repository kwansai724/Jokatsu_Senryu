require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メールアドレス、性別、住まい、職業、年齢、アンケートがあれば有効な状態であること" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "名前がなければ無効な状態であること" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "メールアドレスがなければ無効な状態であること" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "性別がなければ無効な状態であること" do
    user = build(:user, gender: nil)
    user.valid?
    expect(user.errors[:gender]).to include("を入力してください")
  end

  it "住まいがなければ無効な状態であること" do
    user = build(:user, address: nil)
    user.valid?
    expect(user.errors[:address]).to include("を入力してください")
  end

  it "職業がなければ無効な状態であること" do
    user = build(:user, profession: nil)
    user.valid?
    expect(user.errors[:profession]).to include("を入力してください")
  end

  it "年齢がなければ無効な状態であること" do
    user = build(:user, age: nil)
    user.valid?
    expect(user.errors[:age]).to include("を入力してください")
  end

  it "アンケートがなければ無効な状態であること" do
    user = build(:user, questionary: nil)
    user.valid?
    expect(user.errors[:questionary]).to include("を入力してください")
  end

  it "メッセージが1000文字以内でなければ無効な状態であること" do
    user = build(:user, note: "あ" * 1001)
    user.valid?
    expect(user.errors[:note]).to include("は1000文字以内で入力してください")
  end

  describe "投稿者一覧で名前を検索する" do
    before do
      @user1 = create(:user, name: "大中小")
      @user2 = create(:user, name: "大中")
      @user3 = create(:user, name: "中小")
    end

    context "一致する名前が見つかるとき" do
      it "投稿者一覧の検索で、入力した文字が完全一致していれば検索結果が表示されること" do
        expect(User.name_like("大中小")).to include(@user1)
      end
      it "投稿者一覧の検索で、入力した文字が部分一致していれば検索結果が表示されること" do
        expect(User.name_like("小")).to include(@user1, @user3)
      end
    end

    context "一致する名前が見つからない時" do
      it "投稿者一覧の検索で、入力した文字が１件もヒットしなければ一覧に何も表示されないこと" do
        expect(User.name_like("松竹梅")).to be_empty
      end
    end
  end

  it "投稿者（User）は複数の投稿ができること" do
    user = create(:user, :with_posts)
    expect(user.posts.length).to eq 2
  end
end
