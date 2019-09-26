class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :effect

      t.timestamps
    end
  end
end
