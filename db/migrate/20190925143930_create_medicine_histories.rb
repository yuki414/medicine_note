class CreateMedicineHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :medicine_histories do |t|
      t.string :date
      t.references :user
      t.references :pharmacist
      t.references :medicine
      t.string :dose
      t.string :adm

      t.timestamps
    end
  end
end
