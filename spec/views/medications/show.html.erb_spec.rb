# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('medications/show', type: :view) do
  before do
    assign(:medication, Medication.create!(
                          name: 'Name',
                          stock: 2,
                          notes: 'MyText'
                        )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Name/))
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(/MyText/))
  end
end
