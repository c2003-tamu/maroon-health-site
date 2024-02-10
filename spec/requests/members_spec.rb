# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe('/members', type: :request) do
  # This should return the minimal set of attributes required to create a valid
  # Member. As you add validations to Member, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Member.create!(valid_attributes)
      get members_url
      expect(response).to(be_successful)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      member = Member.create!(valid_attributes)
      get member_url(member)
      expect(response).to(be_successful)
    end
  end

  #describe 'GET /new' do
   # it 'renders a successful response' do
    #  get new_member_url
     # expect(response).to(be_successful)
    #end
  #end

  describe 'GET /edit' do
    it 'renders a successful response' do
      member = Member.create!(valid_attributes)
      get edit_member_url(member)
      expect(response).to(be_successful)
    end
  end

  #describe 'POST /create' do
   # context 'with valid parameters' do
    #  it 'creates a new Member' do
     #   expect do
      #    post(members_url, params: { member: valid_attributes })
       # end.to(change(Member, :count).by(1))
    #  end

     # it 'redirects to the created member' do
     #   post members_url, params: { member: valid_attributes }
      #  expect(response).to(redirect_to(member_url(Member.last)))
     # end
   # end

   # context 'with invalid parameters' do
  #    it 'does not create a new Member' do
   #     expect do
    #      post(members_url, params: { member: invalid_attributes })
     #   end.to(change(Member, :count).by(0))
     # end

    #  it "renders a response with 422 status (i.e. to display the 'new' template)" do
     #   post members_url, params: { member: invalid_attributes }
      #  expect(response).to(have_http_status(:unprocessable_entity))
     # end
   # end
 # end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested member' do
        member = Member.create!(valid_attributes)
        patch member_url(member), params: { member: new_attributes }
        member.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the member' do
        member = Member.create!(valid_attributes)
        patch member_url(member), params: { member: new_attributes }
        member.reload
        expect(response).to(redirect_to(member_url(member)))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        member = Member.create!(valid_attributes)
        patch member_url(member), params: { member: invalid_attributes }
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested member' do
      member = Member.create!(valid_attributes)
      expect do
        delete(member_url(member))
      end.to(change(Member, :count).by(-1))
    end

    it 'redirects to the members list' do
      member = Member.create!(valid_attributes)
      delete member_url(member)
      expect(response).to(redirect_to(members_url))
    end
  end
end
