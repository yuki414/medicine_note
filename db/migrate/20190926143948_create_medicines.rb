class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines do |t|
      t.string :name
      t.integer :kind
      t.string :effect
      t.text :description

      t.timestamps
    end
  end
end
