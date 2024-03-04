# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/edit', type: :view) do
  let(:event) do
    Event.create!(
      title: 'MyString',
      ideal_volunteers: 2,
      m1_m2_volunteers: 1,
      m3_m4_volunteers: 1,
      start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
      end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
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
    sign_in admin_member
    assign(:event, event)
  end

  it 'renders the edit event form' do
    render

    assert_select 'form[action=?][method=?]', event_path(event), 'post' do
      assert_select 'input[name=?]', 'event[title]'
      assert_select 'input[name=?]', 'event[ideal_volunteers]'
      assert_select 'input[name=?]', 'event[m1_m2_volunteers]'
      assert_select 'input[name=?]', 'event[m3_m4_volunteers]'
    end
  end
end
