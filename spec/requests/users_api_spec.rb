require 'rails_helper'

RSpec.describe "Users Api", type: :request do
  describe "GET /users_api" do
    it "#index" do
      get users_path
      expect(response).to be_successful
      expect(response).to have_http_status "200"
    end
  end
end
