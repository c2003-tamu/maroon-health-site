# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('faqs/show', type: :view) do
  before do
    assign(:faq, Faq.create!(
                   question: 'MyText',
                   answer: 'MyText'
                 )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(/MyText/))
  end
end
