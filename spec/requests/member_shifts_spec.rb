require 'rails_helper'

RSpec.describe "MemberShifts", type: :request do

  let(:admin_member) do
    Member.create!(
      email: 'user@gmail.com',
      password: 'password123',
      role: 'admin'
    )
  end

  before do
    sign_in admin_member
  end

  describe "GET /new" do
    it "returns http success" do
      get "/member_shifts/new"
      puts response.body
      puts response.status
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/member_shifts/create"
      puts response.body
      puts response.status
      expect(response).to have_http_status(:success)
    end
  end

end
