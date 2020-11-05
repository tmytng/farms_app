class Post < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :leadstatus
  belongs_to_active_hash :product
end
