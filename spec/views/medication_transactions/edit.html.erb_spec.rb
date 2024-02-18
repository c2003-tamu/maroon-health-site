# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medication_transactions/edit', type: :view) do
  let(:member1) { Member.create!(full_name: 'Ada', role: 'admin', email: 'test@gmail.com', password: 'test12') }
  let(:medication) { Medication.create!(name: 'Panadol', stock: 100, notes: 'For headaches and fever') }

  let(:medication_transaction) do
    MedicationTransaction.create!(
      medication: medication,
      member: member1,
      amount: 1
    )
  end

  let(:admin_member) do
    Member.create!(
      email: 'ilovebeinganadmin@gmail.com',
      password: 'adminstuff69',
      role: 'admin'
    )
  end
  let(:volunteer_member) do
    Member.create!(
      email: 'ilovevolunteering@gmail.com',
      password: 'ilovehelpingpeople123',
      role: 'volunteer'
    )
  end

  before do
    sign_in admin_member
    assign(:medication_transaction, medication_transaction)
  end

  it 'renders the edit medication_transaction form' do
    render

    assert_select 'form[action=?][method=?]', medication_transaction_path(medication_transaction), 'post' do
      assert_select 'input[name=?]', 'medication_transaction[medication_id]'
      assert_select 'input[name=?]', 'medication_transaction[amount]'
    end
  end
end
