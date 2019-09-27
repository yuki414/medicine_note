class CreateInstitutions < ActiveRecord::Migration[5.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :address
      t.string :contact

      t.timestamps
    end
  end
end
