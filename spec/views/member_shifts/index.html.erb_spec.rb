# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/index', type: :view) do
  before do
    assign(:events, [
      Event.create!(
        title: 'Title',
        ideal_volunteers: 2,
        m1_m2_volunteers: 1,
        m3_m4_volunteers: 1,
        start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
        end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
      ),
      Event.create!(
        title: 'Title',
        ideal_volunteers: 2,
        m1_m2_volunteers: 1,
        m3_m4_volunteers: 1,
        start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
        end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
      )
    ]
    )
    sign_in admin_member
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

  it 'renders a list of events' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
  end
end
