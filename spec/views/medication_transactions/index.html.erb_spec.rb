# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medication_transactions/index', type: :view) do
  before do
    # Create instances of Medication and Member
    medication = Medication.create!(name: 'Panadol', stock: 100, notes: 'For headaches and fever')
    member = Member.create!(full_name: 'John', role: 'admin', email: 'test@gmail.com', password: 'test12')

    assign(:medication_transactions, [
      MedicationTransaction.create!(
        medication: medication,
        member: member,
        amount: 2
      ),
      MedicationTransaction.create!(
        medication: medication,
        member: member,
        amount: 2
      )
    ]
    )
  end

  it 'renders a list of medication_transactions' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'

    # Assert that the rendered HTML does not contain the string 'nil'
    assert_select cell_selector, text: Regexp.new('nil'), count: 0

    # Assert that the rendered HTML contains the string '2'
    assert_select cell_selector, text: Regexp.new(2.to_s)
  end
end
