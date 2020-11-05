class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :messages
  validates :name, presence: true
  validates :email, uniqueness: true
  mount_uploader :image, ImageUploader
end
