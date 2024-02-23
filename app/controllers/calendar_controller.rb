# frozen_string_literal: true

class CalendarController < ApplicationController
  def index
    # get events only after or on the current date
    calendar_events = CalendarEvent.where('start_datetime >= ?', Time.zone.today)
    # put them in order
    calendar_events = calendar_events.order(:start_datetime)
    # group events that are on the same date together
    @grouped_events = calendar_events.group_by { |event| event.start_datetime.to_date }
  end
end
