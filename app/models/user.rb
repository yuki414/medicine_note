class User < ApplicationRecord
  has_one :profile
  has_many :medicine_histories
  has_many :side_effects
  # has_many :followings
  # has_many :user_pharmacists, through: :followings
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  
  has_secure_password
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 40 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true
  
  def self.search(search)
    return User.all unless search
    User.where(['name LIKE ?', "%#{search}%"])
      .or(User.where(['email LIKE ?', "%#{search}%"]))
  end
  
end
