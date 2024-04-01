# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('calendar_events/edit', type: :view) do
  let(:calendar_event) do
    CalendarEvent.create!(
      title: 'MyString',
      description: 'MyText',
      start_datetime: DateTime.now,
      end_datetime: DateTime.now + 1.hour
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
    assign(:calendar_event, calendar_event)
    sign_in admin_member
  end

  it 'renders the edit calendar_event form' do
    render

    assert_select 'form[action=?][method=?]', calendar_event_path(calendar_event), 'post' do
      assert_select 'input[name=?]', 'calendar_event[title]'

      assert_select 'textarea[name=?]', 'calendar_event[description]'
    end
  end

  it 'spits out error to user if title blank' do
    visit edit_calendar_event_path(calendar_event)

    fill_in 'calendar_event[title]', with: ''

    click_button 'Update Calendar event'

    expect(page).to(have_content("Title can't be blank"))
  end

  it 'spits out error to user if no description' do
    visit edit_calendar_event_path(calendar_event)

    fill_in 'calendar_event[description]', with: ''
    click_button 'Update Calendar event'

    expect(page).to(have_content("Description can't be blank"))
  end

  it 'works with valid attributes' do
    visit edit_calendar_event_path(calendar_event)

    fill_in 'calendar_event[description]', with: 'hellooooo'

    fill_in 'calendar_event[title]', with: 'say hello'

    click_button 'Update Calendar event'

    expect(page).to(have_content('Calendar event was successfully updated.'))
  end
end
