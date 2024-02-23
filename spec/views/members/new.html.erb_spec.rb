# frozen_string_literal: true

# spec/views/members/new.html.erb_spec.rb
require 'rails_helper'

RSpec.describe('members/new', type: :view) do
  before do
    assign(:member, Member.new(
                      role: 'admin',
                      full_name: 'MyString',
                      email: 'test@gmail.com',
                      password: 'test12'
                    )
    )
    render
  end

  it 'renders the new member form' do
    expect(rendered).to(have_selector('form[action="/members"]', count: 1))
    expect(rendered).to(have_field('member_full_name', with: 'MyString'))
    expect(rendered).to(have_field('member_role', with: 'admin'))
  end
end
