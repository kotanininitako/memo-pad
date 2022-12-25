class Memo < ApplicationRecord
  validates :content, length: { maximum: 255 }
end
