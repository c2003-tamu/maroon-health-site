# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/index', type: :view) do
  before do
    allow(view).to(receive(:current_member).and_return(admin_member))
    assign(:events, [
      Event.create!(
        title: 'Title',
        ideal_volunteers: 2,
        ideal_underclassmen: 0,
        ideal_upperclassmen: 0,
        start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
        end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
      ),
      Event.create!(
        title: 'Title 2',
        ideal_volunteers: 2,
        ideal_underclassmen: 0,
        ideal_upperclassmen: 0,
        start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
        end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
      )
    ]
    )
  end

  let(:admin_member) do
    Member.create!(
      email: 'ilovebeinganadmin@gmail.com',
      password: 'adminstuff69',
      role: 'admin'
    )
  end

  it 'renders a list of events' do
    render

    expect(rendered).to(match(/Title/))
    expect(rendered).to(match(/Title 2/))
  end
end
