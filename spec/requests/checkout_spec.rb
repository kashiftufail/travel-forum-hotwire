require 'rails_helper'

RSpec.describe "Checkouts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/checkout/index"
      expect(response).to have_http_status(:success)
    end
  end

end
