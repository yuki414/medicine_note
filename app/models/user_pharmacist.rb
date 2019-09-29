class UserPharmacist < ApplicationRecord
  has_secure_password

  before_save { self.email = email.downcase }
  validates :password, presence: true
  validates :name,  presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 40 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
end
