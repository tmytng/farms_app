# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
