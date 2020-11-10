class Project < ApplicationRecord
  has_many :project_users
  has_many :posts
  has_many :users, through: :project_users
  has_many :messages
  has_one_attached :project_image
  validates :name, presence: true, uniqueness: true

end
