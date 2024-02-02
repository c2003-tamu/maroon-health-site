require 'rails_helper'

RSpec.describe "medication_transactions/new", type: :view do
  before(:each) do
    assign(:medication_transaction, MedicationTransaction.new(
      medication: nil,
      member: nil,
      amount: 1
    ))
  end

  it "renders new medication_transaction form" do
    render

    assert_select "form[action=?][method=?]", medication_transactions_path, "post" do

      assert_select "input[name=?]", "medication_transaction[medication_id]"

      assert_select "input[name=?]", "medication_transaction[member_id]"

      assert_select "input[name=?]", "medication_transaction[amount]"
    end
  end
end
