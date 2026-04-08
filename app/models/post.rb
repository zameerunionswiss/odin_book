class Post < ApplicationRecord
  belongs_to :user
  has_many  :comments, dependent: :destroy
  broadcasts_to ->(post) {"posts"}, inserts_by: :prepend

  validates :title, presence: true
  validates :user, presence: true
  scope :recent, -> { order(created_at: :desc) }
  scope :not_mine, -> (user){ where.not(user: user) }


end
