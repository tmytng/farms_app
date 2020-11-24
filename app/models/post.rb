class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true
  has_many_attached :post_files

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :leadstatus
  belongs_to_active_hash :product

  audited max_audits: 1000

  def self.csv_attributes
    ["id", "company_name", "company_address", "company_url", "prefecture_id", "contact_person", "contact_reason", "phone_number", "email", "leadstatus_id", "purchase_date", "product_id", "contact_des", "project_id", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |post|
        csv << csv_attributes.map{|attr| post.send(attr)}
      end
    end
  end
end
