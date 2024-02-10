# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('members/new', type: :view) do
  before do
    assign(:member, Member.new(
                      role: nil,
                      full_name: 'MyString',
                      email: 'test@gmail.com',
                      password: 'test12'
                    )
    )
  end

end
