# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('MemberShifts', type: :request) do
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

  describe 'GET /new' do
    it 'renders the new template successfully' do
      event = Event.create!(title: 'Event Title', ideal_volunteers: 5, m1_m2_volunteers: 3, m3_m4_volunteers: 2, start_time: Time.zone.now, end_time: Time.zone.now + 2.hours)
      get '/member_shifts/new', params: { event_id: event.id }

      expect(response).to(have_http_status(:success))
    end
  end

  describe 'POST /create' do
    it 'creates a new member shift successfully' do
      event = Event.create!(title: 'Event Title', ideal_volunteers: 5, m1_m2_volunteers: 3, m3_m4_volunteers: 2, start_time: Time.zone.now, end_time: Time.zone.now + 2.hours)
      member = Member.create!(email: 'user@example.com', password: 'password', role: 'volunteer')

      post '/member_shifts', params: { member_shift: { member_id: member.id }, event_id: event.id }
      follow_redirect!
      expect(response).to(have_http_status(:success))
    end
  end
end
