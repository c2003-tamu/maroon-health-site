# spec/features/navbar_spec.rb
require 'rails_helper'

RSpec.feature 'Navbar', type: :feature do
  scenario 'is visible on each page' do

    visit '/'
    expect(page).to have_selector('nav')

    visit '/about'
    expect(page).to have_selector('nav')

  end
end
