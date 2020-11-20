class Project < ApplicationRecord
  has_many :project_users, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :users, through: :project_users
  has_many :messages, dependent: :destroy
  has_one_attached :prj_image
  validates :name, presence: true, uniqueness: true
  validates :profile, presence: true, uniqueness: true
  validates :user_ids, presence: true
  # validates :project_user_ids, presence: true

end
