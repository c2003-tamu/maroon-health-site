class AddUidToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :uid, :string
  end
end
