class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :parent, class_name: 'Memo', optional: true
  has_many :memos, foreign_key: 'parent_id', dependent: :destroy
  
  validates :content, length: { maximum: 255 }
  validates :parent, presence: true, if: :parent_id?
end
