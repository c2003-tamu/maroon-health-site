require 'rails_helper'

RSpec.describe "Donations", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/donation"
      expect(response).to have_http_status(:success)
    end
  end

end
