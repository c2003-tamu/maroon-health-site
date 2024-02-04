# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('members/edit', type: :view) do
  let(:member) do
    Member.create!(
      role: Role.create!(name: 'Volunteer'),
      first_name: 'MyString',
      last_name: 'MyString'
    )
  end

  before do
    assign(:member, member)
  end

  it 'renders the edit member form' do
    render

    assert_select 'form[action=?][method=?]', member_path(member), 'post' do
      assert_select 'input[name=?]', 'member[role_id]'

      assert_select 'input[name=?]', 'member[first_name]'

      assert_select 'input[name=?]', 'member[last_name]'
    end
  end
end
