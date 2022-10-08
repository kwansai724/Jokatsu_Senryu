require 'rails_helper'

RSpec.describe Voterpost, type: :model do
  describe "各部門の推薦理由の最大文字数" do
    context "正常系" do
      it "各部門の推薦理由の最大文字数は1000文字であること" do
        voterpost = build(:voterpost)
        expect(voterpost).to be_valid
      end
    end

    context "異常系" do
      it "各部門の推薦理由の最大文字数は1001文字の場合は無効であること" do
        voterpost = build(:voterpost, :over_number_of_characters)
        expect(voterpost).to be_invalid
      end
    end
  end
end
