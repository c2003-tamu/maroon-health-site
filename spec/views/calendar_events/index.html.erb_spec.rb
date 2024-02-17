require 'rails_helper'

RSpec.describe "calendar_events/index", type: :view do
  before(:each) do
    assign(:calendar_events, [
      CalendarEvent.create!(
        title: "Title",
        description: "MyText"
      ),
      CalendarEvent.create!(
        title: "Title",
        description: "MyText"
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
