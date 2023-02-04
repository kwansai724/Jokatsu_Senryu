require 'rails_helper'

RSpec.describe VoterpostsController, type: :controller do
  describe "#index" do
    context "アカウント登録済みの場合" do
      before do
        @voter = create(:voter)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @voter
        get :index
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in @voter
        get :index
        expect(response).to have_http_status "200"
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :index
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :index
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#show" do
    context "アカウント登録済みの場合" do
      before do
        @voter = create(:voter)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @voter
        get :show, params: { id: "任意のid" }
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in @voter
        get :show, params: { id: "任意のid" }
        expect(response).to have_http_status "200"
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :show, params: { id: "任意のid" }
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :show, params: { id: "任意のid" }
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#edit" do
    context "アカウント登録済みの場合" do
      before do
        @voter = create(:voter)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @voter
        get :edit, params: { id: "任意のid" }
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in @voter
        get :edit, params: { id: "任意のid" }
        expect(response).to have_http_status "200"
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :edit, params: { id: "任意のid" }
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :edit, params: { id: "任意のid" }
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
        voterpost_params = @voterpost.update_attributes(favorite_post1: 1, reason1: "テスト推薦理由")
        sign_in @voter
        patch :update, params: { id: @voterpost.id, voter_id: @voter.id, voterpost: voterpost_params }
        expect(@voterpost.reload.favorite_post1).to eq 1
        expect(@voterpost.reload.reason1).to eq "テスト推薦理由"
      end

      it "推薦川柳、推薦理由が未入力の場合、無効であること" do
        voterpost_params = @voterpost.update_attributes(favorite_post1: "", reason1: "")
        sign_in @voter
        patch :update, params: { id: @voterpost.id, voter_id: @voter.id, voterpost: voterpost_params }
        expect(flash[:danger]).to include("投票に失敗しました。")
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :update, params: { id: "任意のid" }
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :update, params: { id: "任意のid" }
        expect(response).to redirect_to "/"
      end
    end
  end
end
