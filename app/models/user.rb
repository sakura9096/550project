class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

         
  has_many :active_relationships, class_name: "Followship", foreign_key: "follower_id",
  										dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Followship", foreign_key: "followed_id",
  										dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :movie_relations, class_name: "Like", foreign_key: "user_id"
  has_many :movies, through: :movie_relations, source: :movie

  has_many :notifications, dependent: :destroy


  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
    end
  end

  def like(movie)
    movie_relations.create(movie_id: movie.id)
  end

  def unlike(movie)
    movie_relations.find_by(movie_id: movie.id).destroy
  end

  def liked?(movie)
    movies.include?(movie)
  end

  def feed
    Like.where("user_id IN (?)", following_ids).includes(:movie)
  end

  def temp_access_token
    Rails.cache.fetch("user-#{self.id}-temp_access_token-#{Time.now.strftime("%Y%m%d")}") do
      SecureRandom.hex
    end
  end

end
