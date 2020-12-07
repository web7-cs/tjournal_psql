class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Gravtastic
  gravtastic
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :teaching_ideas, dependent: :destroy
    has_many :active_relationships, class_name:  "Relationship",
                                    foreign_key: "follower_id",
                                    dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                                     foreign_key: "followed_id",
                                     dependent:   :destroy
    has_many :following, through: :active_relationships,  source: :followed
    has_many :followers, through: :passive_relationships, source: :follower
    attr_accessor :remember_token, :activation_token, :reset_token
    validates :username,  presence: true, length: { maximum: 50 }

    def feed
      following_ids = "SELECT followed_id FROM relationships
                       WHERE  follower_id = :user_id"
      TeachingIdea.where("user_id IN (#{following_ids})
                       OR user_id = :user_id", user_id: id)
    end

  
    def follow(other_user)
      following << other_user unless self == other_user
    end

    def unfollow(other_user)
      following.delete(other_user)
    end
  
    def following?(other_user)
      following.include?(other_user)
    end
  

end
  