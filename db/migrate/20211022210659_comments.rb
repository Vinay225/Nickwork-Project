# frozen_string_literal: true

class Comments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :description
      t.integer :news_post_id
      t.string :userID
      t.timestamps
    end
  end
end
