class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :trackable
  rolify
  has_many :posts
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :messages
  has_one_attached :avatar
  has_many :audits
  after_create :assign_admin_role
  after_create :assign_default_role

  validates :name, :email, presence: true, uniqueness: true
  validates :name, length: { maximum: 15 }
  validates :name, length: { minimum: 3 }

  scope :recent, -> { order(created_at: :desc) }

  def assign_default_role
    self.add_role(:operator) if self.roles.blank?
  end

  def assign_admin_role
    self.add_role(:admin) if self.name == 'admin'
  end
end

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end


