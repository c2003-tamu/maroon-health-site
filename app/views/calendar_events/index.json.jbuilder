# frozen_string_literal: true

json.array!(@calendar_events, partial: 'calendar_events/calendar_event', as: :calendar_event)
