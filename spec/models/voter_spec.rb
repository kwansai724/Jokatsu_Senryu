require 'rails_helper'

RSpec.describe Voter, type: :model do
  it "名前がなければ無効な状態であること" do
    voter = build(:voter, name: nil)
    voter.valid?
    expect(voter.errors[:name]).to include("を入力してください")
  end
  it "重複した名前は無効であること" do
    @voter1 = create(:voter)
    @voter2 = build(:voter, name: "#{@voter1.name}")
    @voter2.valid?
    expect(@voter2.errors[:name]).to include("はすでに存在します")
  end

  it "名前の文字数上限は５０文字であること" do
    voter = build(:voter, name: "あああああああああああああああああああああああああああああああああああああああああああああああああああ")
    voter.valid?
    expect(voter.errors[:name]).to include("は50文字以内で入力してください")
  end

  it "会社名（group）がなければ無効であること" do
    voter = build(:voter, group: nil)
    voter.valid?
    expect(voter.errors[:group]).to include("を入力してください")
  end
end
