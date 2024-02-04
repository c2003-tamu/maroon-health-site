# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medication_transactions/edit', type: :view) do
  let(:role_volunteer) { Role.create!(name: 'Volunteer') }
  let(:member1) { Member.create!(first_name: 'Ada', last_name: 'Lovelace', role: role_volunteer) }
  let(:medication) { Medication.create!(name: 'Panadol', stock: 100, notes: 'For headaches and fever') }

  let(:medication_transaction) do
    MedicationTransaction.create!(
      medication: medication,
      member: member1,
      amount: 1
    )
  end

  before do
    assign(:medication_transaction, medication_transaction)
  end

  it 'renders the edit medication_transaction form' do
    render

    assert_select 'form[action=?][method=?]', medication_transaction_path(medication_transaction), 'post' do
      assert_select 'input[name=?]', 'medication_transaction[medication_id]'

      assert_select 'input[name=?]', 'medication_transaction[member_id]'

      assert_select 'input[name=?]', 'medication_transaction[amount]'
    end
  end
end
