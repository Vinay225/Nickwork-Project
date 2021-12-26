# frozen_string_literal: true

class CreateGalleries < ActiveRecord::Migration[6.1]
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
