# frozen_string_literal: true

class Leadstatus < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: 'なし' }, { id: 2, name: '新規' }, { id: 3, name: '提案中' },
    { id: 4, name: '顧客判断待ち' }, { id: 5, name: '内示あり' }, { id: 6, name: '受注' },
    { id: 7, name: '失注' }, { id: 8, name: '納品済' }, { id: 9, name: '対応保留中' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts, dependent: :nullify
end
