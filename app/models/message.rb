# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_rich_text :content

  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }
end
