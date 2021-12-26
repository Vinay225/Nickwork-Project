# frozen_string_literal: true

class NewsPost < ApplicationRecord
  validates :name, presence: true
  validates :userID, presence: true
  validates :title, presence: true
  validates :description, presence: true

  # Each NewsPost can have many comments, if a NewsPost is deleted
  # so are the comments attached to it
  has_many :comments, dependent: :destroy
end
