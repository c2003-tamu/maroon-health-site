# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(MedicationTransactionsController, type: :controller) do
  let(:medication) { Medication.create!(name: 'Example Medication', stock: 100) }
  let(:member) { Member.create!(full_name: 'Example Member', email: 'example@example.com', password: 'password123', role: 'admin') }

  let(:valid_attributes) do
    { medication_id: medication.id, member_id: member.id, amount: 10 }
  end

  let(:invalid_attributes) do
    { medication_id: nil, member_id: nil, amount: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to(be_successful)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      transaction = MedicationTransaction.create!(valid_attributes)
      get :show, params: { id: transaction.to_param }
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
      transaction = MedicationTransaction.create!(valid_attributes)
      get :edit, params: { id: transaction.to_param }
      expect(response).to(be_successful)
    end
  end

  # describe 'POST #create' do
  #  context 'with valid params' do
  #    it 'creates a new Medication Transaction and redirects to show' do
  #      expect {
  #        post :create, params: { medication_transaction: valid_attributes }
  #      }.to change(MedicationTransaction, :count).by(1)

  #      expect(response).to have_http_status(:redirect)
  #      expect(response).to redirect_to(medication_transaction_path(MedicationTransaction.last))
  #    end
  #  end

  #  context 'with invalid params' do
  #    it 'renders the new template with unprocessable_entity status' do
  #      post :create, params: { medication_transaction: invalid_attributes }
  #      expect(response).to have_http_status(:unprocessable_entity)
  #      expect(response).to render_template('new')
  #      expect(assigns(:medication_transaction).errors).not_to be_empty
  #    end
  #  end
  # end

  # describe 'PUT #update' do
  #  let(:transaction) { MedicationTransaction.create!(valid_attributes) }

  #  context 'with valid params' do
  #    it 'updates the Medication Transaction and redirects to show' do
  #      put :update, params: { id: transaction.to_param, medication_transaction: valid_attributes }
  #      expect(response).to have_http_status(:redirect)
  #      expect(response).to redirect_to(medication_transaction_path(transaction.reload))
  #    end
  #  end

  #  context 'with invalid params' do
  #    it 'renders the edit template with unprocessable_entity status' do
  #      put :update, params: { id: transaction.to_param, medication_transaction: invalid_attributes }
  #      expect(response).to have_http_status(:unprocessable_entity)
  #      expect(response).to render_template('edit')
  #      expect(assigns(:medication_transaction).errors).not_to be_empty
  #    end
  #  end
end

# describe 'DELETE #destroy' do
#  let!(:transaction) { MedicationTransaction.create!(valid_attributes) }

#  it 'destroys the requested medication transaction' do
#    expect {
#      delete :destroy, params: { id: transaction.to_param }
#    }.to change(MedicationTransaction, :count).by(-1)
#  end

#  it 'redirects to the medication transactions list' do
#    delete :destroy, params: { id: transaction.to_param }
#    expect(response).to redirect_to(medication_transactions_url)
#  end
# end
# end
