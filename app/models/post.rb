# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true
  has_many_attached :attachments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :leadstatus
  belongs_to_active_hash :product

  audited associated_with: :project

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :company_name, presence: true, length: { maximum: 30 }
  validates :prefecture_id, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 47 }, exclusion: { in: ['---'] }
  validates :company_address, allow_blank: true, length: { maximum: 40 }
  validates :contact_person, allow_blank: true, length: { maximum: 20 }
  validates :phone_number, allow_blank: true, format: { with: VALID_PHONE_REGEX, message: 'は有効でありません。' }
  validates :email, allow_blank: true, length: { maximum: 50 }, format: { with: VALID_EMAIL_REGEX, message: 'は有効でありません。' }
  validates :leadstatus_id, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 10 }, exclusion: { in: ['---'] }
  validates :product_id, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }, exclusion: { in: ['---'] }
  validates :contact_reason, presence: true, length: { maximum: 30 }
  validates :contact_des, presence: true, length: { maximum: 1000 }

  scope :recent, -> { order(created_at: :desc) }

  def self.csv_attributes
    %w[id company_name company_address company_url prefecture_id contact_person contact_reason phone_number email leadstatus_id purchase_date product_id contact_des project_id created_at updated_at]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.find_each do |post|
        csv << csv_attributes.map { |attr| post.send(attr) }
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
