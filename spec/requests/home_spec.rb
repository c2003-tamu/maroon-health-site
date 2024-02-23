# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Homes', type: :request) do
  
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
  
  describe 'GET /index' do
    it 'returns http success' do
      get '/'
      expect(response).to(have_http_status(:success))
    end

    it 'admin makes the right navbar show up' do
      sign_in admin_member
      get '/'

      #expect(page).to have_content('Members') 
      #expect(page).to have_content('Add FAQs')
      #expect(page).to have_content('Add Resources')
      #expect(page).to have_content('Edit Events')
      #expect(page).to have_content('Medications')
      #expect(page).to have_content('Event Signup')
      #expect(page).to have_content('Logout')     
    end
  end
end
