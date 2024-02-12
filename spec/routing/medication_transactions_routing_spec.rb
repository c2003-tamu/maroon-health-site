# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(MedicationTransactionsController, type: :routing) do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/medication_transactions').to(route_to('medication_transactions#index'))
    end

    it 'routes to #new' do
      expect(get: '/medication_transactions/new').to(route_to('medication_transactions#new'))
    end

    it 'routes to #show' do
      expect(get: '/medication_transactions/1').to(route_to('medication_transactions#show', id: '1'))
    end

    it 'routes to #edit' do
      expect(get: '/medication_transactions/1/edit').to(route_to('medication_transactions#edit', id: '1'))
    end

    it 'routes to #create' do
      expect(post: '/medication_transactions').to(route_to('medication_transactions#create'))
    end

    it 'routes to #update via PUT' do
      expect(put: '/medication_transactions/1').to(route_to('medication_transactions#update', id: '1'))
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/medication_transactions/1').to(route_to('medication_transactions#update', id: '1'))
    end

    it 'routes to #destroy' do
      expect(delete: '/medication_transactions/1').to(route_to('medication_transactions#destroy', id: '1'))
    end
  end
end
