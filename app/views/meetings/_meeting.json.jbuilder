# frozen_string_literal: true

json.extract! meeting, :id, :title, :description, :meeting_date, :location, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
