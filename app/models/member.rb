# frozen_string_literal: true

class Member < ApplicationRecord
  validates :name, presence: true,
                   format: { with: /ni[c|k]/i, message: 'Name must be a variation of Nick (must contain "nic" or "nik")' }
  # validates :description, presence: true
  # validates :birthday, presence: true
  # validates :classification, presence: true
  # validates :major, presence: true
  validates :email, presence: true
  # validates :phone, presence: true
  has_one_attached :photo

  # Only allowed files for the image are PNG, JPG, JPEG
  validates :photo, attached: false, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
