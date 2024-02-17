# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(MembersController, type: :controller) do
  let(:valid_attributes) do
    { full_name: 'John Doe', email: 'john@example.com', role: 'admin', password: 'password' }
  end

  let(:invalid_attributes) do
    { full_name: nil, email: nil, role: 'blahblahblah', password: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to(be_successful)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      member = Member.create!(valid_attributes)
      get :show, params: { id: member.to_param }
      expect(response).to(be_successful)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      member = Member.create!(valid_attributes)
      get :edit, params: { id: member.to_param }
      expect(response).to(be_successful)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the member and redirects to show' do
        member = Member.create!(valid_attributes)
        put :update, params: { id: member.to_param, member: valid_attributes }
        expect(response).to(redirect_to(member_path(member.reload)))
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested member' do
      member = Member.create!(valid_attributes)
      expect do
        delete(:destroy, params: { id: member.to_param })
      end.to(change(Member, :count).by(-1))
    end

    it 'redirects to the members list' do
      member = Member.create!(valid_attributes)
      delete :destroy, params: { id: member.to_param }
      expect(response).to(redirect_to(members_url))
    end
  end
end
