# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable
  rolify
  has_many :audits, dependent: :nullify
  has_many :messages, dependent: :nullify
  has_many :posts, dependent: :nullify
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :stockers, dependent: :destroy
  has_one_attached :avatar
  # before_create :default_avatar
  after_create :assign_admin_role
  after_create :assign_default_role

  validates :name, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 15 }
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates :profile, length: { maximum: 240 }

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
      user.name = 'ゲスト管理者'
      user.admin = true
      user.add_role(:admin)
    end
  end

  def already_stocked?(post)
    stockers.exists?(post_id: post.id)
  end

  def default_avatar
    if self.avatar.attached?
      self.avatar.attach(io: File.open('images/default_user.png'), filename: 'default_user_avatar.png', content_type: 'image/png')
    end
  end
end
