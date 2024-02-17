require 'rails_helper'

RSpec.describe "calendar_events/index", type: :view do
  before(:each) do
    assign(:calendar_events, [
      CalendarEvent.create!(
        title: "Event 1",
        description: "Description for Event 1",
        start_datetime: DateTime.now,
        end_datetime: DateTime.now + 2.hours
      ),

      CalendarEvent.create!(
        title: "Event 2",
        description: "Description for Event 2",
        start_datetime: DateTime.now + 1.day,
        end_datetime: DateTime.now + 1.day + 3.hours
      )
    ])
  end

  it "renders a list of calendar_events" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
