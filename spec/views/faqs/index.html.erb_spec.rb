# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('faqs/index', type: :view) do
  before do
    assign(:faqs, [
      Faq.create!(
        question: 'MyText',
        answer: 'MyText'
      ),
      Faq.create!(
        question: 'MyText',
        answer: 'MyText'
      )
    ]
    )
  end

  it 'renders a list of faqs' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 4
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 4
  end
end
