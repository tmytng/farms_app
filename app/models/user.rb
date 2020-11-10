class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :messages
  has_one_attached :avatar
  validates :name, presence: true
  validates :email, uniqueness: true
end
