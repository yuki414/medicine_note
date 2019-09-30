class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "UserPharmacist"
  validates :follower_id, presence: true
  validates :following_id, presence: true
end
