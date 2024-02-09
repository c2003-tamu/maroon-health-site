# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/edit', type: :view) do
  let(:event) do
    Event.create!(
      title: 'MyString',
      ideal_volunteers: 1,
      ideal_officers: 1
    )
  end

  before do
    assign(:event, event)
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(event), 'post' do
      assert_select 'input[name=?]', 'event[title]'

      assert_select 'input[name=?]', 'event[ideal_volunteers]'

      assert_select 'input[name=?]', 'event[ideal_officers]'
    end
  end
end
