# frozen_string_literal: true

class CreateNewsPost < ActiveRecord::Migration[6.1]
  def change
    create_table :news_posts do |t|
      t.string :name
      t.string :userID
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
