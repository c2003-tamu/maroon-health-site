# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/show', type: :view) do
  before do
    assign(:event, Event.create!(
                     title: 'Title',
                     ideal_volunteers: 2,
                     ideal_m1: 0,
                     ideal_m2: 0,
                     ideal_m3: 0,
                     ideal_m4: 0,
                     start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
                     end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
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

  it 'renders attributes in <p>' do
    render
    expect(rendered).to(match(/Title/))
    expect(rendered).to(match(/2/))
  end
end
