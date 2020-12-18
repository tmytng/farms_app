# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :project_users, dependent: :destroy
  has_associated_audits
  has_many :posts, dependent: :destroy
  has_many :users, through: :project_users
  has_many :messages, dependent: :destroy
  has_one_attached :prj_image
  validates :name, presence: true, uniqueness: true
  validates :profile, presence: true, length: { maximum: 300 }
  validates :user_ids, presence: true
  validates :creator, presence: true
  # validates :project_user_ids, presence: true

  # def  last_log
  #   associated_audits.ids.to_s.last
  # end

  def self.search(search)
    if search == ''
      Project.all
    else
      Project.where('profile LIKE(?)', "%#{search}%")
    end
  end
end
