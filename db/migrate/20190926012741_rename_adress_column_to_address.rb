class RenameAdressColumnToAddress < ActiveRecord::Migration[5.1]
  def change
    rename_column :institutions, :adress, :address
  end
end
