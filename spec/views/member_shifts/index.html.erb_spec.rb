# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/index', type: :view) do
  before do
    assign(:events, [
      Event.create!(
        title: 'Title',
        ideal_volunteers: 2,
        ideal_officers: 3
      ),
      Event.create!(
        title: 'Title',
        ideal_volunteers: 2,
        ideal_officers: 3
      )
    ]
    )
  end

  it 'renders a list of events' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
