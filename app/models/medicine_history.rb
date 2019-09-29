class MedicineHistory < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacist
  belongs_to :medicine
  validates :date, presence: true
end
