require 'rails_helper'

RSpec.describe "Voterposts Api", type: :request do
  describe "#index" do
    context "アカウント登録済みの場合" do
      before do
        @voter = create(:voter)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @voter
        get voterposts_path
        expect(response).to be_successful
        expect(response).to have_http_status "200"
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get voterposts_path
        expect(response).to have_http_status "302"
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#show" do
    # context "アカウント登録済みの場合" do
    #   before do
    #     @voter = create(:voter)
    #     @category == "女性パワーで未来を変えるの部"
    #     @posts = Post.eager_load(:user).where(category: @category).paginate(page: params[:page],per_page: 100)
    #   end

    #   it "正常にレスポンスを返すこと" do
    #     sign_in @voter
    #     get voterpost_path(@voter)
    #     expect(response).to be_successful
    #     expect(response).to have_http_status "200"
    #   end
    # end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get voterpost_path(id: "")
        expect(response).to have_http_status "302"
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#edit" do
    # context "アカウント登録済みの場合" do
    #   before do
    #     @voter = create(:voter)
    #     @voterpost = create(:voterpost)
    #     @check = @voter.favorites.where(category: "女性パワーで未来を変えるの部")
    #   end

    #   it "正常にレスポンスを返すこと" do
    #     sign_in @voter
    #     get edit_voterpost_path(@voter)
    #     expect(response).to be_successful
    #     expect(response).to have_http_status "200"
    #   end
    # end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get edit_voterpost_path(id: "")
        expect(response).to have_http_status "302"
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#update" do
    context "アカウント登録済みの場合" do
      before do
        @voter = create(:voter)
        @voterpost = create(:voterpost, :empty_voterpost)
      end

      it "推薦川柳、推薦理由を投稿できること" do
        voterpost_params = @voterpost.update(favorite_post1: 1, reason1: "テスト推薦理由")
        sign_in @voter
        patch voterpost_path(@voter), params: { id: @voterpost.id, voter_id: @voter.id, voterpost: voterpost_params }
        expect(@voterpost.reload.favorite_post1).to eq 1
        expect(@voterpost.reload.reason1).to eq "テスト推薦理由"
      end

      it "推薦川柳、推薦理由が未入力の場合、無効であること" do
        voterpost_params = @voterpost.update(favorite_post1: "", reason1: "")
        sign_in @voter
        patch voterpost_path(@voter), params: { id: @voterpost.id, voter_id: @voter.id, voterpost: voterpost_params }
        expect(flash[:danger]).to include("投票に失敗しました。")
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get voterpost_path(id: "")
        expect(response).to have_http_status "302"
        expect(response).to redirect_to "/"
      end
    end
  end
end
