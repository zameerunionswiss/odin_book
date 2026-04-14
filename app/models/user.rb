class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  has_many :posts
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # those who follow you
  has_many :follower_associations, class_name: "Follow", foreign_key: "follower_id"
  has_many :followers, through: :follower_associations, source: :follower

  # those who you follow
  has_many :followed_associations, class_name: "Follow", foreign_key: "followed_id"
  has_many :followed, class_name: "Follow", through: :followed_associations, source: :followed
end
