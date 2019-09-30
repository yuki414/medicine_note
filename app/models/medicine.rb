class Medicine < ApplicationRecord
  has_many :medicine_histories
  has_many :side_effects
  def self.search(search)
      return Medicine.all unless search
      Medicine.where(['name LIKE ?', "%#{search}%"])
        .or(Medicine.where(['effect LIKE ?', "%#{search}%"]))
  end
end
