class CreatePharmacists < ActiveRecord::Migration[5.1]
  def change
    create_table :pharmacists do |t|
      t.string :name
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
