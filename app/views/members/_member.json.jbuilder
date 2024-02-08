# frozen_string_literal: true

json.extract!(member, :id, :role, :full_name, :created_at, :updated_at)
json.url(member_url(member, format: :json))
