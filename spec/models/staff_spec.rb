require 'rails_helper'

RSpec.describe Staff, type: :model do

  it "login_idがなければ無効であること" do
    staff = build(:staff, login_id: nil)
    expect(staff).to be_invalid
  end
  
  describe "login_idについて" do
    context "正常系" do
      it "login_idの文字数は8文字であること" do
        staff = build(:staff)
        expect(staff).to be_valid
      end
    end
    
    context "異常系" do
      it "login_idの文字数が7文字以下の場合、無効であること" do
        staff = build(:staff, :under_of_login_id)
        expect(staff).to be_invalid
        expect(staff.errors[:login_id]).to include("は8文字で入力してください")
      end
      it "login_idの文字数が9文字以上の場合、無効であること" do
        staff = build(:staff, :over_of_login_id)
        expect(staff).to be_invalid
        expect(staff.errors[:login_id]).to include("は8文字で入力してください")
      end
    end
  end
end
