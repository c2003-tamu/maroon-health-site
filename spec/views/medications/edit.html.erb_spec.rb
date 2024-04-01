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
    assign(:medication, medication)
    sign_in admin_member
  end

  it 'renders the edit medication form' do
    render

    assert_select 'form[action=?][method=?]', medication_path(medication), 'post' do
      assert_select 'input[name=?][value=?]', 'medication[name]', 'MyString'
      assert_select 'input[name=?][value=?]', 'medication[stock]', '1'
      assert_select 'textarea[name="medication[notes]"]', text: 'MyString'

      assert_select 'input[type=submit][value=?]', 'Update Medication'
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

    expect(page).to(have_content('Stock must be greater than or equal to 0'))
  end

  it 'has error if name is empty' do
    visit edit_medication_path(medication)

    fill_in 'medication[name]', with: ''

    click_button 'Update Medication'

    expect(page).to(have_content("Name can't be blank"))
  end
end
