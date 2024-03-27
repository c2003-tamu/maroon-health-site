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
    expect(rendered).to(include('Url'))
    expect(rendered).to(include('Title'))
    expect(rendered).to(include('MyText'))
  end
end
