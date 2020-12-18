# frozen_string_literal: true

class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :text
    add_column :users, :position, :string
    add_column :users, :image, :string
    add_column :users, :admin, :boolean, default: false
  end
end
