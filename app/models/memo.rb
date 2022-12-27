class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: 'Memo', optional: true
  has_many :memos
  
  validates :content, length: { maximum: 255 }
  validates :parent, presence: true, if: :parent_id?
end
