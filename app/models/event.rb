# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date_time, presence: true
  validates :location, presence: true
  has_one_attached :photo

  # Only allowed files for the image are PNG, JPG, JPEG
  validates :photo, attached: false, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
