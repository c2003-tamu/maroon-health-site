# spec/controllers/roles_controller_spec.rb

require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  let(:valid_attributes) {
    { name: 'Admin' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      role = Role.create! valid_attributes
      get :show, params: { id: role.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      role = Role.create! valid_attributes
      get :edit, params: { id: role.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Role and redirects to show' do
        expect {
          post :create, params: { role: valid_attributes }
        }.to change(Role, :count).by(1)

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(role_path(Role.last))
      end
    end

    context 'with invalid params' do
      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { role: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template('new')
        expect(assigns(:role).errors).not_to be_empty
      end
    end
  end

  describe 'PUT #update' do
    let(:role) { Role.create! valid_attributes }

    context 'with valid params' do
      it 'updates the Role and redirects to show' do
        put :update, params: { id: role.to_param, role: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(role_path(role.reload))
      end
    end

    context 'with invalid params' do
      it 'renders the edit template with unprocessable_entity status' do
        put :update, params: { id: role.to_param, role: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template('edit')
        expect(assigns(:role).errors).not_to be_empty
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:role) { Role.create! valid_attributes }

    it 'destroys the requested role' do
      expect {
        delete :destroy, params: { id: role.to_param }
      }.to change(Role, :count).by(-1)
    end

    it 'redirects to the roles list' do
      delete :destroy, params: { id: role.to_param }
      expect(response).to redirect_to(roles_url)
    end
  end
end
