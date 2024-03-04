class AddIdealVolunteersDefaultOnEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :ideal_volunteers, :integer, default: 0
  end
end
