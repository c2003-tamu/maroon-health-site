# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(ResourcesController, type: :controller) do
  let(:valid_attributes) do
    { url: 'https://example.com', title: 'Example Resource', description: 'This is a sample resource.' }
  end
  let(:invalid_attributes) do
    { url: nil, title: nil, description: nil }
  end
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

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to(be_successful)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      resource = Resource.create!(valid_attributes)
      get :show, params: { id: resource.to_param }
      expect(response).to(be_successful)
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to(be_successful)
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      resource = Resource.create!(valid_attributes)
      get :edit, params: { id: resource.to_param }
      expect(response).to(be_successful)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Resource and redirects to show' do
        expect do
          post(:create, params: { resource: valid_attributes })
        end.to(change(Resource, :count).by(1))

        expect(response).to(have_http_status(:redirect))
        expect(response).to(redirect_to(resources_path))
      end
    end

    context 'with invalid params' do
      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { resource: invalid_attributes }
        expect(response).to(have_http_status(:unprocessable_entity))
        expect(response).to(render_template('new'))
        expect(assigns(:resource).errors).not_to(be_empty)
      end
    end
  end

  describe 'PUT #update' do
    let(:resource) { Resource.create!(valid_attributes) }

    context 'with valid params' do
      it 'updates the Resource and redirects to show' do
        put :update, params: { id: resource.to_param, resource: valid_attributes }
        expect(response).to(have_http_status(:redirect))
        expect(response).to(redirect_to(resources_path))
      end
    end

    context 'with invalid params' do
      it 'renders the edit template with unprocessable_entity status' do
        put :update, params: { id: resource.to_param, resource: invalid_attributes }
        expect(response).to(have_http_status(:unprocessable_entity))
        expect(response).to(render_template('edit'))
        expect(assigns(:resource).errors).not_to(be_empty)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:resource) { Resource.create!(valid_attributes) }

    it 'destroys the requested resource' do
      expect do
        delete(:destroy, params: { id: resource.to_param })
      end.to(change(Resource, :count).by(-1))
    end

    it 'redirects to the resources list' do
      delete :destroy, params: { id: resource.to_param }
      expect(response).to(redirect_to(resources_url))
    end
  end
end
