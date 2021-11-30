require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { create(:like) }

  it "post_idとvoter_idがある場合、有効であること" do
    expect(like).to be_valid
  end

  it "post_idがない場合、無効であること" do
    like.post_id = nil
    expect(like).to be_invalid
  end

  it "voter_idがない場合、無効であること" do
    like.voter_id = nil
    expect(like).to be_invalid
  end

end
