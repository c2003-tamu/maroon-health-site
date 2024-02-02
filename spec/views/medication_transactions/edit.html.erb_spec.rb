require 'rails_helper'

RSpec.describe "medication_transactions/edit", type: :view do
  let(:medication_transaction) {
    MedicationTransaction.create!(
      medication: nil,
      member: nil,
      amount: 1
    )
  }

  before(:each) do
    assign(:medication_transaction, medication_transaction)
  end

  it "renders the edit medication_transaction form" do
    render

    assert_select "form[action=?][method=?]", medication_transaction_path(medication_transaction), "post" do

      assert_select "input[name=?]", "medication_transaction[medication_id]"

      assert_select "input[name=?]", "medication_transaction[member_id]"

      assert_select "input[name=?]", "medication_transaction[amount]"
    end
  end
end
