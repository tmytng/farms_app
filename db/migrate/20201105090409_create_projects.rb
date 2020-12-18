# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :profile
      t.string :image
      t.index :name, unique: true
      t.timestamps
    end
  end
end
