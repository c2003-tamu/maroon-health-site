# frozen_string_literal: true

# spec/features/navbar_spec.rb
require 'rails_helper'

RSpec.describe('Navbar', type: :feature) do
  it 'is visible on each page' do
    visit '/'
    expect(page).to(have_selector('nav'))

    visit '/about'
    expect(page).to(have_selector('nav'))

    visit '/donation'
    expect(page).to(have_selector('nav'))
  end
end
