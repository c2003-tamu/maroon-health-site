class ChangeIdealClassmenOnEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :ideal_m1, :integer
    remove_column :events, :ideal_m2, :integer
    remove_column :events, :ideal_m3, :integer
    remove_column :events, :ideal_m4, :integer

    add_column :events, :ideal_underclassmen, :integer, default: 0
    add_column :events, :ideal_upperclassmen, :integer, default: 0

    change_column_default :events, :ideal_volunteers, 0
  end
end
