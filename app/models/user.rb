class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  has_many :posts
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Users following this user (other people follow me)
  has_many :follower_relationships, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :follower_relationships, source: :follower

  # Users this user is following (people I follow)
  has_many :following_relationships, class_name: "Follow", foreign_key: "follower_id"
  has_many :following, through: :following_relationships, source: :followed


    def feed
      Post.where(user_id: following.select(:id))
    end
  def follow(user)
    following_relationships.create(follower_id: self.id, followed_id: user.id) unless following?(user)
  end

  def unfollow(user)
    following_relationships.find_by(followed_id: user.id)&.destroy
  end

  def following?(user)
    following_relationships.exists?(followed_id: user.id)
  end
end
