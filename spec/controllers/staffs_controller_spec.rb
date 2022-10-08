require 'rails_helper'

RSpec.describe Staffs::StaffsController, type: :controller do
  describe "#toppage" do
    context "アカウント登録済みの場合" do
      before do
        @staff = create(:staff)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @staff
        get :toppage
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in @staff
        get :toppage
        expect(response).to have_http_status "200"
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :toppage
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :toppage
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#index" do
    context "アカウント登録済みの場合" do
      before do
        @staff = create(:staff)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @staff
        get :index
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in @staff
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

  describe "#users_index" do
    context "アカウント登録済みかつ管理者権限を持つ場合" do
      before do
        @staff = create(:staff, admin: true)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @staff
        get :users_index
        expect(response).to be_successful
      end

      it "200レスポンスを返すこと" do
        sign_in @staff
        get :users_index
        expect(response).to have_http_status "200"
      end
    end

    # 現状、直接パス入力で管理者権限がなくても閲覧できてしまう。
    # context "アカウント登録済みかつ管理者権限を持たない場合" do
    #   before do
    #     @staff = create(:staff, admin: false)
    #   end

    #   it "302レスポンスを返すこと" do
    #     sign_in @staff
    #     get :users_index
    #     expect(response).to have_http_status "302"
    #   end

    #   it "新規登録画面にリダイレクトすること" do
    #     sign_in @staff
    #     get :users_index
    #     expect(response).to redirect_to "/staffs/staffs/toppage"
    #   end
    # end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :users_index
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :users_index
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#users_show" do
    context "アカウント登録済みかつ管理者権限を持つ場合" do
      before do
        @staff = create(:staff)
        @user = create(:user)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @staff
        get :users_show, params: { id: @user.id }
        expect(response).to be_successful
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :users_show
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :users_show
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#voterposts_index" do
    context "アカウント登録済みの場合" do
      before do
        @staff = create(:staff)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @staff
        get :voterposts_index
        expect(response).to be_successful
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :voterposts_index
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :voterposts_index
        expect(response).to redirect_to "/"
      end
    end
  end

  describe "#voterposts_show" do
    context "アカウント登録済みの場合" do
      before do
        @staff = create(:staff)
        @voter = create(:voter)
      end

      it "正常にレスポンスを返すこと" do
        sign_in @staff
        get :voterposts_show, params: { id: @voter.id }
        expect(response).to be_successful
      end
    end

    context "アカウント未登録の場合" do
      it "302レスポンスを返すこと" do
        get :voterposts_show
        expect(response).to have_http_status "302"
      end

      it "新規登録画面にリダイレクトすること" do
        get :voterposts_show
        expect(response).to redirect_to "/"
      end
    end
  end
end
