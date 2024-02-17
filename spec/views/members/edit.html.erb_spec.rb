# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('members/edit', type: :view) do
  let(:member) do
    Member.create!(
      email: 'test@gmail.com',
      password: 'test12',
      role: 'admin'
    )
  end

  before do
    assign(:member, member)
  end

  let(:admin_member) do
    Member.create!(
      email: 'ilovebeinganadmin@gmail.com',
      password: 'adminstuff69',
      role: 'admin'
    )
  end
  let(:volunteer_member) do
    Member.create!(
      email: 'ilovevolunteering@gmail.com',
      password: 'ilovehelpingpeople123',
      role: 'volunteer'
    )
  end

  before do
    sign_in admin_member
  end 

  it 'renders the edit member form' do
    visit edit_member_path(member)

    click_button 'Update'

    expect(page).to have_content('Member was successfully updated')
  end
end
