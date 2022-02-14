class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gym

  validates :gym_id, uniqueness: { scope: :user_id }
  validate :my_post_cannot_like

  private

  def my_post_cannot_like
    errors.add(:base) if user_id == gym.user_id
  end
end
