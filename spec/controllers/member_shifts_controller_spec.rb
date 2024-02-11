# spec/controllers/member_shifts_controller_spec.rb

require 'rails_helper'

RSpec.describe MemberShiftsController, type: :controller do
  let(:valid_attributes) {
    { title: 'Shift Title', ideal_volunteers: 5, ideal_officers: 2, start_time: Time.now, end_time: Time.now + 2.hours }
  }

  let(:invalid_attributes) {
    { title: nil, ideal_volunteers: -1, ideal_officers: 0, start_time: nil, end_time: nil }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      member_shift = MemberShift.create! valid_attributes
      get :show, params: { id: member_shift.to_param }
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
      member_shift = MemberShift.create! valid_attributes
      get :edit, params: { id: member_shift.to_param }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new MemberShift and redirects to show' do
        expect {
          post :create, params: { member_shift: valid_attributes }
        }.to change(MemberShift, :count).by(1)

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(member_shift_path(MemberShift.last))
      end
    end

    context 'with invalid params' do
      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { member_shift: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template('new')
        expect(assigns(:member_shift).errors).not_to be_empty
      end
    end
  end

  describe 'PUT #update' do
    let(:member_shift) { MemberShift.create! valid_attributes }

    context 'with valid params' do
      it 'updates the MemberShift and redirects to show' do
        put :update, params: { id: member_shift.to_param, member_shift: valid_attributes }
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(member_shift_path(member_shift.reload))
      end
    end

    context 'with invalid params' do
      it 'renders the edit template with unprocessable_entity status' do
        put :update, params: { id: member_shift.to_param, member_shift: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template('edit')
        expect(assigns(:member_shift).errors).not_to be_empty
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:member_shift) { MemberShift.create! valid_attributes }

    it 'destroys the requested member shift' do
      expect {
        delete :destroy, params: { id: member_shift.to_param }
      }.to change(MemberShift, :count).by(-1)
    end

    it 'redirects to the member shifts list' do
      delete :destroy, params: { id: member_shift.to_param }
      expect(response).to redirect_to(member_shifts_url)
    end
  end
end
