require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/bookings/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/bookings/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /search" do
    it "returns http success" do
      get "/bookings/search"
      expect(response).to have_http_status(:success)
    end
  end

end
