class ChangeRoleToString < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :role_id
    add_column :members, :role, :string
  end
end
