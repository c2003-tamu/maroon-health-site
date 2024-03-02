# frozen_string_literal: true

# spec/features/photo_gallery_spec.rb
require 'rails_helper'

RSpec.describe('Photo Gallery', type: :feature) do
  it 'the photo gallery is rendered on the home page' do
    visit photos_path
    expect(page).to(have_content('Photo Gallery'))
    expect(page).to(have_css('.photo-gallery img'))
  end
end
