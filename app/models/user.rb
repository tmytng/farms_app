class User < ApplicationRecord
  has_secure_password
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable, :trackable
  rolify
  has_many :posts
  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
  has_many :messages
  has_one_attached :avatar
  attr_accessor :image
  has_many :audits
  after_create :assign_admin_role
  after_create :assign_default_role

  # validates :name, :email, presence: true, uniqueness: true
  # validates :name, length: { maximum: 15 }
  # validates :name, length: { minimum: 3 }

  scope :recent, -> { order(created_at: :desc) }

  def assign_default_role
    self.add_role(:operator) if self.roles.blank?
  end

  def assign_admin_role
    self.add_role(:admin) if self.name == 'admin'
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def avatar=(image)
    if image.present?
      prefix = image[/(image|application)(\/.*)(?=\;)/]
      type = prefix.sub(/(image|application)(\/)/, '')
      data = Base64.decode64(image.sub(/data:#{prefix};base64,/, ''))
      filename = "#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.#{type}"
      File.open("#{Rails.root}/tmp/#{filename}", 'wb') do |f|
        f.write(data)
      end
      avatar.detach if avatar.attached?
      avatar.attach(io: File.open("#{Rails.root}/tmp/#{filename}"), filename: filename)
      FileUtils.rm("#{Rails.root}/tmp/#{filename}")
    end
  end

end
