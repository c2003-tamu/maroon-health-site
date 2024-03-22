# frozen_string_literal: true

# spec/features/photo_gallery_spec.rb
require 'rails_helper'

RSpec.describe('Photo Gallery', type: :feature) do
  it 'the photo gallery is rendered on the page' do
    visit photos_path
    expect(page).to(have_content('A Snapshot of Maroon Health'))
    expect(page).to(have_css('.image-container img'))
    # ensure there are multiple images on the page
    expect(page).to(have_selector('img', minimum: 2))
  end
end
