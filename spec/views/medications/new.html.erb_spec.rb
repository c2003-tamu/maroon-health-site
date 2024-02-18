# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medications/new', type: :view) do
  before do
    assign(:medication, Medication.new(
                          name: 'MyString',
                          stock: 1,
                          notes: 'MyString'
                        )
    )
    sign_in admin_member
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

  it 'renders new medication form' do
    render

    assert_select 'form[action=?][method=?]', medications_path, 'post' do
      assert_select 'input[name=?]', 'medication[name]'
      assert_select 'input[name=?]', 'medication[stock]'
      assert_select 'input[name=?]', 'medication[notes]'
    end
  end

  it 'Works when adding medications' do
    visit new_medication_path

    fill_in 'medication[name]', with: 'aspirin'
    fill_in 'medication[stock]', with: 3
    fill_in 'medication[notes]', with: 'note'

    click_button 'Create Medication'

    expect(page).to(have_content('Medication was successfully created.'))
  end

  it 'does not work when we put in negative stock' do
    visit new_medication_path

    fill_in 'medication[name]', with: 'a'
    fill_in 'medication[stock]', with: -222
    fill_in 'medication[notes]', with: ''

    click_button 'Create Medication'

    expect(page).to(have_content('1 error prohibited this medication from being saved'))
  end

  it 'does not work when we put no name' do
    visit new_medication_path

    fill_in 'medication[stock]', with: 2
    fill_in 'medication[notes]', with: 'hi'

    click_button 'Create Medication'
    expect(page).to(have_content('1 error prohibited this medication from being saved'))
  end

  it 'has 2 errors when no name and negative stock' do
    visit new_medication_path

    fill_in 'medication[stock]', with: -2
    fill_in 'medication[notes]', with: 'hi'

    click_button 'Create Medication'
    expect(page).to(have_content('2 errors prohibited this medication from being saved'))
  end
end
