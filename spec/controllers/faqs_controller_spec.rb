# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(FaqsController, type: :controller) do
  let(:admin_member) do
    Member.create!(
      email: 'ilovebeinganadmin@gmail.com',
      password: 'adminstuff69',
      role: 'admin'
    )
  end
  let(:valid_attributes) do
    { question: 'What is your question?', answer: 'This is the answer.' }
  end
  let(:invalid_attributes) do
    { question: nil, answer: nil }
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
      faq = Faq.create!(valid_attributes)
      get :show, params: { id: faq.to_param }
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
      faq = Faq.create!(valid_attributes)
      get :edit, params: { id: faq.to_param }
      expect(response).to(be_successful)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Faq and redirects to index' do
        expect do
          post(:create, params: { faq: valid_attributes })
        end.to(change(Faq, :count).by(1))

        expect(response).to(have_http_status(:redirect))
        expect(response).to(redirect_to(faqs_path))
      end
    end

    context 'with invalid params' do
      it 'renders the edit template with unprocessable_entity status' do
        faq = Faq.create!(valid_attributes)
        put :create, params: { id: faq.to_param, faq: invalid_attributes }
        expect(response).to(have_http_status(:unprocessable_entity))
        expect(response).to(render_template('new'))
        # Ensure there are validation errors
        expect(assigns(:faq).errors).not_to(be_empty)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the Faq and redirects to index' do
        faq = Faq.create!(valid_attributes)
        updated_attributes = { question: 'Updated Question', answer: 'Updated Answer' }

        put :update, params: { id: faq.to_param, faq: updated_attributes }

        expect(response).to(have_http_status(:redirect))
        expect(response).to(redirect_to(faqs_path))
        # Ensure the question was updated
        expect(assigns(:faq).question).to(eq('Updated Question'))
        # Ensure the answer was updated
        expect(assigns(:faq).answer).to(eq('Updated Answer'))
      end
    end

    context 'with invalid params' do
      it 'renders the edit template with unprocessable_entity status' do
        faq = Faq.create!(valid_attributes)
        put :update, params: { id: faq.to_param, faq: invalid_attributes }
        expect(response).to(have_http_status(:unprocessable_entity))
        expect(response).to(render_template('edit'))
        # Ensure there are validation errors
        expect(assigns(:faq).errors).not_to(be_empty)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested faq' do
      faq = Faq.create!(valid_attributes)
      expect do
        delete(:destroy, params: { id: faq.to_param })
      end.to(change(Faq, :count).by(-1))
    end

    it 'redirects to the faqs list' do
      faq = Faq.create!(valid_attributes)
      delete :destroy, params: { id: faq.to_param }
      expect(response).to(redirect_to(faqs_url))
    end
  end
end
