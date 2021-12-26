# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :news_post_id, presence: true
  validates :userID, presence: true

  self.primary_key = 'id'
  # Each comment belongs to a news_post
  belongs_to :news_post
end
