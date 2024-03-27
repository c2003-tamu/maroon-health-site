
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'resources/index', type: :view do
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
    ])
  end

  it 'renders a list of resources' do
    render
    assert_select 'div>p', text: /Url/, count: 2
    assert_select 'div>p', text: /Title/, count: 2
    assert_select 'div>p', text: /MyText/, count: 2
  end
end
