require 'rails_helper'

RSpec.describe "calendar_events/edit", type: :view do
  let(:calendar_event) {
    CalendarEvent.create!(
      title: "MyString",
      description: "MyText",
      start_datetime: DateTime.now,
      end_datetime: DateTime.now + 1.hour
    )
  }

  before(:each) do
    assign(:calendar_event, calendar_event)
  end

  it "renders the edit calendar_event form" do
    render

    assert_select "form[action=?][method=?]", calendar_event_path(calendar_event), "post" do

      assert_select "input[name=?]", "calendar_event[title]"

      assert_select "textarea[name=?]", "calendar_event[description]"
    end
  end
end
