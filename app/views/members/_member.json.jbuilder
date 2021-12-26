# frozen_string_literal: true

json.extract! member, :id, :title, :description, :meeting_date, :location, :created_at, :updated_at
json.url member_url(member, format: :json)
