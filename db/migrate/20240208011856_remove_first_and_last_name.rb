class RemoveFirstAndLastName < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :first_name
    remove_column :members, :last_name
  end
end
