# frozen_string_literal: true

json.extract!(calendar_event, :id, :title, :description, :start_datetime, :end_datetime, :created_at, :updated_at)
json.url(calendar_event_url(calendar_event, format: :json))
