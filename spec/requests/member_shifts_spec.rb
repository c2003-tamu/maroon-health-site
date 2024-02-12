require 'rails_helper'

RSpec.describe "MemberShifts", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/member_shifts/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/member_shifts/create"
      expect(response).to have_http_status(:success)
    end
  end

end
