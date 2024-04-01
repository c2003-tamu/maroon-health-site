# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('calendar_events/new', type: :view) do
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
    assign(:calendar_event, CalendarEvent.new(
                              title: 'MyString',
                              description: 'MyText',
                              start_datetime: DateTime.now,
                              end_datetime: DateTime.now + 1.hour
                            )
    )
  end

  it 'renders new calendar_event form' do
    render

    assert_select 'form[action=?][method=?]', calendar_events_path, 'post' do
      assert_select 'input[name=?]', 'calendar_event[title]'

      assert_select 'textarea[name=?]', 'calendar_event[description]'
    end
  end

  it 'allows valid attributes' do
    visit new_calendar_event_path

    fill_in 'calendar_event[title]', with: 'test'
    fill_in 'calendar_event[description]', with: 'this is a test'
    fill_in 'calendar_event[start_datetime]', with: DateTime.now
    fill_in 'calendar_event[end_datetime]', with: DateTime.now + 1.hour

    click_button 'Create Calendar event'

    expect(page).to(have_content('Calendar event was successfully created.'))
  end

  it 'does not allow empty title' do
    visit new_calendar_event_path

    fill_in 'calendar_event[description]', with: 'this is a test'
    fill_in 'calendar_event[start_datetime]', with: DateTime.now
    fill_in 'calendar_event[end_datetime]', with: DateTime.now + 1.hour

    click_button 'Create Calendar event'

    expect(page).to(have_content("Title can't be blank"))
  end

  it 'does not allow end datetime before start' do
    visit new_calendar_event_path

    fill_in 'calendar_event[title]', with: 'test'
    fill_in 'calendar_event[description]', with: 'this is a test'
    fill_in 'calendar_event[start_datetime]', with: DateTime.now
    fill_in 'calendar_event[end_datetime]', with: DateTime.now - 1.hour

    click_button 'Create Calendar event'

    expect(page).to(have_content('End datetime must be after the start datetime'))
  end

  it 'does not let start and endtime be blank' do
    visit new_calendar_event_path

    fill_in 'calendar_event[title]', with: 'test'
    fill_in 'calendar_event[description]', with: 'this is a test'

    click_button 'Create Calendar event'

    expect(page).to(have_content("Start datetime can't be blank"))
    expect(page).to(have_content("End datetime can't be blank"))
  end
end
