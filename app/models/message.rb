# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_rich_text :content

  validates :title, presence: true, length: { maximum: 32 }
  # validate :validate_content_attachment_byte_size
  validate :validate_content_length

  MAX_CONTENT_LENGTH = 400
  ONE_KILOBYTE = 1024
  MEGABYTE = 3
  MAX_CONTENT_ATTACHMENT_BYTE_SIZE = MEGABYTE * 1_000 * ONE_KILOBYTE

  default_scope -> { order(created_at: :desc) }

  private

  def validate_content_length
    errors.add(:content, :too_long) if content.to_plain_text.length > MAX_CONTENT_LENGTH
  end

  # def validate_content_attachment_byte_size
  #   content.body.attachables.grep(ActiveStrage::Blobs).each do |attachable|
  #     if attachable > MAX_CONTENT_ATTACHMENT_BYTE_SIZE
  #       errors.add(:base, :content_attachment_byte_size_is_too_big)
  #     end
  #   end
  # end
end
