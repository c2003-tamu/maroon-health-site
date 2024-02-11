require 'rails_helper'

RSpec.describe MedicationsController, type: :controller do
  let(:valid_attributes) {
    { name: 'Aspirin', stock: 20, notes: 'Pain relief' }
  }

  let(:invalid_attributes) {
    { name: nil, stock: nil, notes: nil }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #index with search' do
    it 'returns a success response' do
        medication1 = Medication.create!(name: 'Aspirin', stock: 20, notes: 'Pain relief')
        medication2 = Medication.create!(name: 'Tylenol', stock: 15, notes: 'Headache relief')

        get :index, params: { search: 'asp' }

        expect(response).to be_successful
        expect(assigns(:medications)).to eq([medication1])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      medication = Medication.create! valid_attributes
      get :show, params: { id: medication.to_param }
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
      medication = Medication.create! valid_attributes
      get :edit, params: { id: medication.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Medication and redirects to show' do
        expect {
          post :create, params: { medication: valid_attributes }
        }.to change(Medication, :count).by(1)

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(medication_path(Medication.last))
      end
    end

    context 'with invalid params' do
      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { medication: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template('new')
        expect(assigns(:medication).errors).not_to be_empty
      end
    end
  end

  describe 'PUT #update' do
    let(:medication) { Medication.create! valid_attributes }

    context 'with valid params' do
      it 'updates the Medication and redirects to show' do
        updated_attributes = { name: 'Updated Aspirin', stock: 25, notes: 'Updated Pain relief' }
        put :update, params: { id: medication.to_param, medication: updated_attributes }

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(medication_path(medication.reload))
        expect(assigns(:medication).name).to eq('Updated Aspirin')
        expect(assigns(:medication).stock).to eq(25)
        expect(assigns(:medication).notes).to eq('Updated Pain relief')
      end
    end

    context 'with invalid params' do
      it 'renders the edit template with unprocessable_entity status' do
        put :update, params: { id: medication.to_param, medication: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template('edit')
        expect(assigns(:medication).errors).not_to be_empty
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested medication' do
      medication = Medication.create! valid_attributes
      expect {
        delete :destroy, params: { id: medication.to_param }
      }.to change(Medication, :count).by(-1)
    end

    it 'redirects to the medications list' do
      medication = Medication.create! valid_attributes
      delete :destroy, params: { id: medication.to_param }
      expect(response).to redirect_to(medications_url)
    end
  end

  describe 'GET #lowstock' do
    it 'returns a success response' do
      get :lowstock
      expect(response).to be_successful
    end
  end
end
