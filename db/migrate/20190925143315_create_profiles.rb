class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.integer :sex
      t.integer :birthday
      t.float :height
      t.float :weight
      t.string :blood
      t.string :address
      t.string :contact

      t.timestamps
    end
  end
end
