
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('resources/index', type: :view) do
  before do
    assign(:resources, [
      Resource.create!(
        url: 'Url',
        title: 'Title',
        description: 'MyText'
      ),
      Resource.create!(
        url: 'Url',
        title: 'Title',
        description: 'MyText'
      )
    ]
    )
  end

  it 'renders a list of resources' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Url'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
