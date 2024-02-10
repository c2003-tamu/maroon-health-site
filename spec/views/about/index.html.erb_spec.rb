require 'rails_helper'

RSpec.describe "about/index.html.erb", type: :view do
  let(:faq1) { Faq.new(question: 'Question 1', answer: 'Answer 1') }
  let(:faq2) { Faq.new(question: 'Question 2', answer: 'Answer 2') }

  before do
    assign(:faqs, [faq1, faq2])
    render
  end

  it 'displays the FAQs' do
    expect(rendered).to match(/Question 1/)
    expect(rendered).to match(/Answer 1/)
    expect(rendered).to match(/Question 2/)
    expect(rendered).to match(/Answer 2/)
  end
end