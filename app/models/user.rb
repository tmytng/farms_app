class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :trackable
  rolify
  has_many :posts
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :messages
  has_one_attached :avatar
  validates :name, presence: true
  validates :email, uniqueness: true
  has_many :audits
  after_create :assign_admin_role
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:operator) if self.roles.blank?
  end

  def assign_admin_role
    self.add_role(:admin) if self.name == 'admin'
  end
end
