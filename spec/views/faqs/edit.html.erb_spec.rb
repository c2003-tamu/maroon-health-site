# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('faqs/edit', type: :view) do
  let(:faq) do
    Faq.create!(
      question: 'MyText',
      answer: 'MyText'
    )
  end

  before do
    assign(:faq, faq)
  end

  it 'renders the edit faq form' do
    render

    assert_select 'form[action=?][method=?]', faq_path(faq), 'post' do
      assert_select 'textarea[name=?]', 'faq[question]'

      assert_select 'textarea[name=?]', 'faq[answer]'
    end
  end
end
