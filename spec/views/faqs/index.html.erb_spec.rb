# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('faqs/index', type: :view) do
  before do
    assign(:faqs, [
      Faq.create!(
        question: 'Howdy',
        answer: 'MyText'
      ),
      Faq.create!(
        question: 'MyText',
        answer: 'Bye'
      )
    ]
    )
  end

  it 'renders a list of faqs' do
    render
    expect(rendered).to(include('Howdy'))
    expect(rendered).to(include('Bye'))
  end
end
