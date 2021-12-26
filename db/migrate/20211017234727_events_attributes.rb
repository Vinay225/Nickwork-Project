# frozen_string_literal: true

class EventsAttributes < ActiveRecord::Migration[6.1]
  def change
    remove_columns(:events, :event_date, :created_at, :updated_at)

    add_column(:events, :date_time, :datetime)
    add_column(:events, :location, :string)
    add_column(:events, :add_req, :string)
    add_column(:events, :created_at, :datetime)
    add_column(:events, :updated_at, :datetime)
  end
end
