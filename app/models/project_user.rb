# frozen_string_literal: true

class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user
end
