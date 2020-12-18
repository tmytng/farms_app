# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :company_name
      t.string :prefecture_id
      t.string :company_address
      t.string :company_url
      t.string :contact_person
      t.string :phone_number
      t.string :email
      t.string :leadstatus_id
      t.datetime :purchase_date
      t.string :product_id
      t.string :add_file
      t.string :contact_reason
      t.text :contact_des
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
