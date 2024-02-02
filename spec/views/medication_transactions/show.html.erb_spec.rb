require 'rails_helper'

RSpec.describe "medication_transactions/show", type: :view do
  before(:each) do
    assign(:medication_transaction, MedicationTransaction.create!(
      medication: nil,
      member: nil,
      amount: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
