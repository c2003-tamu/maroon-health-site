# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('calendar_events/index', type: :view) do
  before do
    assign(:calendar_events, [
      CalendarEvent.create!(
        title: 'FirstEvent',
        description: 'Description for Event 1',
        start_datetime: DateTime.now,
        end_datetime: DateTime.now + 2.hours
      ),

      CalendarEvent.create!(
        title: 'SecondEvent',
        description: 'Description for Event 2',
        start_datetime: DateTime.now + 1.day,
        end_datetime: DateTime.now + 1.day + 3.hours
      )
    ]
    )
  end

  it 'renders a list of calendar_events' do
    render
    expect(rendered).to(include('FirstEvent'))
    expect(rendered).to(include('SecondEvent'))
    expect(rendered).to(include('Description for Event 1'))
    expect(rendered).to(include('Description for Event 2'))
  end
end
