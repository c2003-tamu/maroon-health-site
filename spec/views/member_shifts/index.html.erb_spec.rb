# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('member_shifts/index', type: :view) do
  before do
    assign(:member_shifts, [
      MemberShift.create!(
        title: 'Title',
        ideal_volunteers: 2,
        ideal_officers: 3,
        start_time: Time.zone.now,
        end_time: Time.zone.now + 1.hour
      ),
      MemberShift.create!(
        title: 'Title',
        ideal_volunteers: 2,
        ideal_officers: 3,
        start_time: Time.zone.now,
        end_time: Time.zone.now + 1.hour
      )
    ]
    )
  end

  it 'renders a list of member_shifts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
  end
end
