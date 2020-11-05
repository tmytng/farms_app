class Project < ApplicationRecord
  has_many :project_users
  has_many :posts
  has_many :users, through: :project_users
  has_many :messages
  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader

end
