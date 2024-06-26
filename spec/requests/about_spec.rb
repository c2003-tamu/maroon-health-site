# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Abouts', type: :request) do
  describe 'GET /index' do
    it 'returns http success' do
      get '/about'
      expect(response).to(have_http_status(:success))
    end
  end
end
