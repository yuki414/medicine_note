class Medicine < ApplicationRecord
  has_many :medicine_histories
  def self.search(search)
      return Medicine.all unless search
      Medicine.where(['name LIKE ?', "%#{search}%"])
  end
end
