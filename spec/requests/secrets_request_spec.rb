require 'rails_helper'

RSpec.describe "Secrets", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/secrets/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/secrets/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/secrets/show"
      expect(response).to have_http_status(:success)
    end
  end

end
