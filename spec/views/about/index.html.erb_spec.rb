require 'rails_helper'

RSpec.describe "about/index.html.erb", type: :view do
  let(:faq1) { Faq.new(question: 'Question 1', answer: 'Answer 1') }
  let(:faq2) { Faq.new(question: 'Question 2', answer: 'Answer 2') }
  let(:rec1) {Resource.new(url: 'https://youtube.com', title: 'youtube')}


  before do
    assign(:faqs, [faq1, faq2])
    assign(:resources, [rec1])
    render
  end

  it 'displays the FAQs' do
    expect(rendered).to match(/Question 1/)
    expect(rendered).to match(/Answer 1/)
    expect(rendered).to match(/Question 2/)
    expect(rendered).to match(/Answer 2/)
    skip "brakeman LinkToHref app/views/about/index.html.erb 66"
  end
end
