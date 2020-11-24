class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true
  has_many_attached :post_files

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :leadstatus
  belongs_to_active_hash :product

  audited max_audits: 1000

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  validates :company_name, presence: true
  validates :prefecture_id, presence: true, exclusion: { in: ["---"] }
  validates :company_address, presence: true
  validates :contact_person, presence: true
  validates :phone_number, format: { with: VALID_PHONE_REGEX, message: 'は有効でありません。'}
  validates :email, presence: true
  validates :purchase_date, presence: true
  validates :leadstatus_id, presence: true, exclusion: { in: ["---"] }
  validates :product_id, presence: true, exclusion: { in: ["---"] }
  validates :contact_reason, presence: true, length: {maximum: 30}
  validates :contact_des, presence: true, length: {maximum: 1000}

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

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      post = new
      post.attributes = row.to_hash.slice(*csv_attributes)
      post.save!
    end
  end
end
