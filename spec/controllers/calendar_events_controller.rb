# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(EventsController, type: :controller) do
  let(:admin_member) do
    Member.create!(
      email: 'ilovebeinganadmin@gmail.com',
      password: 'adminstuff69',
      role: 'admin'
    )
  end

  let(:valid_attributes) do
    { title: 'test event', ideal_volunteers: 0, ideal_m1: 1, ideal_m2: 1, ideal_m3: 1, ideal_m4: 1, start_time: DateTime.now, end_time: DateTime.now + 1.hour }
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
      medication = CalendarEvent.create!(valid_attributes)
      get :show, params: { id: medication.to_param }
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
      medication = CalendarEvent.create!(valid_attributes)
      get :edit, params: { id: medication.to_param }
      expect(response).to(be_successful)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Event and redirects to show' do
        expect do
          post(:create, params: { event: valid_attributes })
        end.to(change(CalendarEvent, :count).by(1))

        expect(response).to(have_http_status(:redirect))
        expect(response).to(redirect_to(event_path(CalendarEvent.last)))
      end
    end
  end
end
