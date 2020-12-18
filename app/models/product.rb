# frozen_string_literal: true

class Product < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: 'ソフトウェア(年一括払い)' }, { id: 2, name: 'ソフトウェア(月払い)' }, { id: 3, name: 'ソフトウェア(優待版)' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
