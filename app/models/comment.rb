class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  validates :content, presence: true, length: { maximum: 140 }
end
