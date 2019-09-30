class UserPharmacist < ApplicationRecord
  # has_many :followings
  # has_many :users, through: :followings
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_secure_password

  before_save { self.email = email.downcase }
  validates :password, presence: true
  validates :name,  presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 40 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  # 患者をフォロー
  def following?(patient)
    following_relationships.find_by(following_id: patient.id)
  end

  # 患者が承認したらture
  def follow!(patient)
    following_relationships.create!(following_id: patient.id)
  end

  # 患者のフォロー解除
  def unfollow!(patient)
    following_relationships.find_by(following_id: patient.id).destroy
  end

  
end
