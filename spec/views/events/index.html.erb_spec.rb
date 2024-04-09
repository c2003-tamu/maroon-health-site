# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('events/index.html.erb', type: :view) do
  before do
    assign(:events, [
      Event.create!(
        title: 'Event 1',
        ideal_underclassmen: 2,
        ideal_upperclassmen: 2,
        ideal_volunteers: 0,
        start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
        end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
      ),
      Event.create!(
        title: 'Event 2',
        ideal_underclassmen: 3,
        ideal_upperclassmen: 3,
        ideal_volunteers: 0,
        start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
        end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
      )
    ]
    )
  end

  it 'renders a list of events' do
    render
    assert_select 'tr>td', text: 'Event 1'.to_s, count: 1
    assert_select 'tr>td', text: 'Event 2'.to_s, count: 1
  end

  it 'has the correct title' do
    render
    expect(rendered).to(have_selector('h1.title', text: 'Edit Volunteering Shifts'))
  end

  it 'has the correct table headers' do
    render
    headers = ['Title', 'M1/M2 Slots Open', 'M3/M4 Slots Open', 'Free-For-All Slots Open', 'Start Time', 'End Time', 'Volunteers', 'Actions']
    headers.each do |header|
      expect(rendered).to(have_selector('th', text: header))
    end
  end

  it 'has the correct action links' do
    render
    expect(rendered).to(have_link('Edit', href: edit_event_path(Event.first)))
    expect(rendered).to(have_link('Delete', href: event_path(Event.first)))
    expect(rendered).to(have_link('Event Email', href: mass_email_form_members_path(event_id: Event.first.id)))
  end

  it "has the 'View All Member Shifts' and 'New Volunteering Shift' links" do
    render
    expect(rendered).to(have_link('View All Member Shifts', href: member_shifts_path))
    expect(rendered).to(have_link('New Volunteering Shift', href: new_event_path))
  end

  it 'displays volunteers in the correct order' do
    user1 = Member.create!(
      full_name: 'User 1',
      email: 'user1@tamu.edu',
      password: 'user1mcuser1face',
      role: 'admin',
      class_year: 'M3'
    )
    user2 = Member.create!(
      full_name: 'User 2',
      email: 'user2@tamu.edu',
      password: 'userihardlyknowher',
      role: 'admin',
      class_year: 'M4'
    )
    MemberShift.create!(member: user1, event: Event.first)
    MemberShift.create!(member: user2, event: Event.first)

    render

    user1_position = rendered.index(user1.full_name)
    user2_position = rendered.index(user2.full_name)

    expect(user1_position).to(be < user2_position)
  end

  # it "only allows eligible volunteers to sign up" do
  #   user1 = Member.create!(
  #     full_name: 'User 1',
  #     email: 'user1@tamu.edu',
  #     password: 'user1mcuser1face',
  #     role: 'admin',
  #     class_year: 'M2'
  #   )
  #   user2 = Member.create!(
  #     full_name: 'User 2',
  #     email: 'user2@tamu.edu',
  #     password: 'userihardlyknowher',
  #     role: 'admin',
  #     class_year: 'M4'
  #   )

  #   event3 = Event.create!(
  #     title: "Event 3",
  #     ideal_underclassmen: 1,
  #     ideal_upperclassmen: 0,
  #     ideal_volunteers: 0,
  #     start_time: 1.day.from_now.strftime('%Y-%m-%d %H:%M:%S'),
  #     end_time: (1.day.from_now + 2.hours).strftime('%Y-%m-%d %H:%M:%S')
  #   )

  #   member_shift1 = MemberShift.create!(member: user1, event: event3)
  #   member_shift2 = MemberShift.create!(member: user2, event: event3) rescue nil

  #   render

  #   user1_position = rendered.index(user1.full_name)
  #   user2_position = rendered.index(user2.full_name)

  #   expect(user1_position).not_to be_nil
  #   expect(user2_position).to be_nil
  # end
end
