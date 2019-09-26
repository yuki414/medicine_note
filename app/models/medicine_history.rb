class MedicineHistory < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacist
  belongs_to :medicine
end
