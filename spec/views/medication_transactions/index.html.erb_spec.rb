require 'rails_helper'

RSpec.describe "medication_transactions/index", type: :view do
  before(:each) do
    assign(:medication_transactions, [
      MedicationTransaction.create!(
        medication: nil,
        member: nil,
        amount: 2
      ),
      MedicationTransaction.create!(
        medication: nil,
        member: nil,
        amount: 2
      )
    ])
  end

  it "renders a list of medication_transactions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
