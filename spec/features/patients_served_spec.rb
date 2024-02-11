# spec/features/photo_gallery_spec.rb
require 'rails_helper'

RSpec.feature 'Patients Served Counter', type: :feature do
  scenario 'the patients served counter is rendered on the home page' do
    visit root_path
    expect(page).to have_content('Patients Served')
    # expect the text to be a number
    expect(page).to have_css('.stat', text: /\d+/)
  end
end
