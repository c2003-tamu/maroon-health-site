# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('members/index', type: :view) do
  before do
    assign(:members, [
      Member.create!(
        role: Role.create!(name: 'Volunteer'),
        first_name: 'First Name',
        last_name: 'Last Name'
      ),
      Member.create!(
        role: Role.create!(name: 'Officer'),
        first_name: 'First Name',
        last_name: 'Last Name'
      )
    ]
    )
  end

  it 'renders a list of members' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s)
    assert_select cell_selector, text: Regexp.new('First Name'.to_s)
    assert_select cell_selector, text: Regexp.new('Last Name'.to_s)
  end
end
