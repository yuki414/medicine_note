class CreateSideEffects < ActiveRecord::Migration[5.1]
  def change
    create_table :side_effects do |t|
      t.integer :user_id
      t.integer :medicine_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
