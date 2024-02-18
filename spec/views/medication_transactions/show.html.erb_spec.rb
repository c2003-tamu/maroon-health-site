# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medication_transactions/show', type: :view) do
  before do
    # Create instances of Medication and Member
    medication = Medication.create!(name: 'Panadol', stock: 100, notes: 'For headaches and fever')
    member = Member.create!(full_name: 'John', role: 'admin', email: 'test@gmail.com', password: 'test12')

    assign(:medication_transaction, MedicationTransaction.create!(
                                      medication: medication,
                                      member: member,
                                      amount: 2
                                    )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
    expect(rendered).to(match(/2/))
  end
end
