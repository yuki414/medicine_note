class Pharmacist < ApplicationRecord
  belongs_to :institution
  has_many :medicine_histories
end
