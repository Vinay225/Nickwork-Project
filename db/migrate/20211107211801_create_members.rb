# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :description
      t.date :birthday
      t.string :classification
      t.string :major
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
