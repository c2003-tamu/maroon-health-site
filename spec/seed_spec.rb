require 'rails_helper'

RSpec.describe 'Test DB was seeded.' do
  it 'should have seeded data in Member' do
    expect(Member.count).to be > 0
  end

  it 'should have seeded data in Faq' do
    expect(Faq.count).to be > 0
  end

  it 'should have seeded data in Role' do
    expect(Role.count).to be > 0
  end

  it 'should have seeded data in Medication' do
    expect(Medication.count).to be > 0
  end

  it 'should have seeded data in MedicationTransaction' do
    expect(MedicationTransaction.count).to be > 0
  end

  it 'should have seeded data in MemberShift' do
    expect(MemberShift.count).to be > 0
  end
end
