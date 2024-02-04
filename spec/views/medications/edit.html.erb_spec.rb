# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medications/edit', type: :view) do
  let(:medication) do
    Medication.create!(
      name: 'MyString',
      stock: 1,
      notes: 'MyText'
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

      assert_select 'textarea[name=?]', 'medication[notes]'
    end
  end
end
