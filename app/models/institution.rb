class Institution < ApplicationRecord
  has_many:pharmacist, dependent: :destroy
end
