class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
  belongs_to :followed, class_name: "User", foreign_key: "followed_id"

  validates :follower_id, uniqueness: { scope: :followed_id }
  validate :cannot_follow_yourself

  private

  def cannot_follow_yourself
    if follower_id == followed_id
      errors.add(:base, "You cannot follow yourself")
    end
  end
end
