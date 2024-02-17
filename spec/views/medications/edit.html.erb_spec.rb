# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medications/edit', type: :view) do
  let(:medication) do
    Medication.create!(
      name: 'MyString',
      stock: 1,
      notes: 'MyString'
    )
  end

  before do
    assign(:medication, medication)
  end

  it 'renders the edit medication form' do
    render

    assert_select 'form[action=?][method=?]', medication_path(medication), 'post' do
      assert_select 'input[name=?]', 'medication[name]'

      assert_select 'input[name=?]', 'medication[stock]'
    end
  end

  it 'successfully edits the right medication' do
    visit edit_medication_path(medication)

    fill_in 'medication[name]', with: 'a'
    fill_in 'medication[stock]', with: 100

    click_button 'Update Medication'

    expect(page).to(have_content('Medication was successfully updated.'))
  end

  it 'has error if stock is negative' do
    visit edit_medication_path(medication)

    fill_in 'medication[name]', with: 'a'
    fill_in 'medication[stock]', with: -2212

    click_button 'Update Medication'

    expect(page).to(have_content('1 error prohibited this medication from being saved'))
  end

  it 'has error if name is empty' do
    visit edit_medication_path(medication)

    fill_in 'medication[name]', with: ''

    click_button 'Update Medication'

    expect(page).to(have_content('1 error prohibited this medication from being saved'))
  end
end
