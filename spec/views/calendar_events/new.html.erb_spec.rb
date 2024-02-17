require 'rails_helper'

RSpec.describe "calendar_events/new", type: :view do
  before(:each) do
    assign(:calendar_event, CalendarEvent.new(
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders new calendar_event form" do
    render

    assert_select "form[action=?][method=?]", calendar_events_path, "post" do

      assert_select "input[name=?]", "calendar_event[title]"

      assert_select "textarea[name=?]", "calendar_event[description]"
    end
  end
end
