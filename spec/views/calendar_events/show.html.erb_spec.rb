require 'rails_helper'

RSpec.describe "calendar_events/show", type: :view do
  before(:each) do
    assign(:calendar_event, CalendarEvent.create!(
      title: "Title",
      description: "MyText",
      start_datetime: DateTime.now,
      end_datetime: DateTime.now + 1.hour
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
