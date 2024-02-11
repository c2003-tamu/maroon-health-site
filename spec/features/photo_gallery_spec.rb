# spec/features/photo_gallery_spec.rb
require 'rails_helper'

RSpec.feature 'Photo Gallery', type: :feature do
  scenario 'the photo gallery is rendered on the home page' do
    visit root_path
    expect(page).to have_content('Photo Gallery')
    expect(page).to have_css('.photo-gallery img')
  end
end
