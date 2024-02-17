require 'rails_helper'

RSpec.describe "MemberShifts", type: :request do

  let(:admin_member) do
    Member.create!(
      email: 'ilovebeinganadmin@gmail.com',
      password: 'adminstuff69',
      role: 'admin'
    )
  end
  let(:volunteer_member) do
    Member.create!(
      email: 'ilovevolunteering@gmail.com',
      password: 'ilovehelpingpeople123',
      role: 'volunteer'
    )
  end

  before do
    sign_in admin_member
  end

  describe "GET /new" do
    it "returns http success" do
      get "/member_shifts/new/1"
      puts response.body
      puts response.status
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/member_shifts/create/1"
      puts response.body
      puts response.status
      expect(response).to have_http_status(:success)
    end
  end

end
