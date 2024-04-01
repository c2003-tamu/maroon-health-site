# frozen_string_literal: true

json.extract!(event, :id, :title, :ideal_volunteers, :ideal_underclassmen, :ideal_upperclassmen, :start_time, :end_time, :created_at, :updated_at)
json.url(event_url(event, format: :json))
