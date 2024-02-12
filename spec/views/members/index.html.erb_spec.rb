# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('members/index', type: :view) do
  before do
    assign(:members, [
      Member.create!(
        role: 'admin',
        full_name: 'Full name',
        email: 'test@gmail.com',
        password: 'test12'
      ),
      Member.create!(
        role: 'volunteer',
        full_name: 'Full name 2',
        email: 'test2@gmail.com',       
        password: 'test12'
      )
    ]
    )
  end

  it 'renders a list of members' do
    visit members_path
    expect(page).to have_content('Full name')
    expect(page).to have_content('Full name 2')
  end
end
