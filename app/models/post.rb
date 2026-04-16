class Post < ApplicationRecord
  belongs_to :user
  has_many  :comments, dependent: :destroy
  has_many_attached :images

  broadcasts_to ->(post) {"posts"}, inserts_by: :prepend

  validates :title, presence: true
  validates :user, presence: true
  scope :in_order, -> { order(created_at: :desc) }
  scope :not_mine, -> (user){ where.not(user: user) }



end
