class CalendarController < ApplicationController
  def index
    @calendar_events = CalendarEvent.all
  end
end
