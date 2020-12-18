# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  rolify
  has_many :posts, dependent: :nullify
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :messages, dependent: :nullify
  has_one_attached :avatar
  has_many :audits, dependent: :nullify
  after_create :assign_admin_role
  after_create :assign_default_role

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, length: { maximum: 15 }
  validates :name, length: { minimum: 3 }

  scope :recent, -> { order(created_at: :desc) }

  def assign_default_role
    add_role(:operator) if roles.blank?
  end

  def assign_admin_role
    add_role(:admin) if name == 'admin'
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    []
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'test-admin'
      user.admin = true
      user.add_role(:admin)
    end
  end
end
