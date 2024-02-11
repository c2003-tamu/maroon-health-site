# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('members/edit', type: :view) do
  let(:member) do
    Member.create!(
      role: Role.create!(name: 'Volunteer'),
      full_name: 'MyString',
      email: 'test@gmail.com',
      password: 'test12'
    )
  end

  before do
    assign(:member, member)
  end

  it 'renders the edit member form' do
    visit edit_member_path(member)

    fill_in 'member[role]', with: 'hello'
    click_button 'Update'

    expect(page).to have_content('Member was successfully updated')
  end
end
