# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('members/show', type: :view) do
  before do
    assign(:member, Member.create!(
                      role: 'admin',
                      full_name: 'First Name',
                      email: 'test@gmail.com',
                      password: 'test12'
                    )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(//))
    expect(rendered).to(match(/First Name/))
  end
end
