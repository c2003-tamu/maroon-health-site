class AddClassYearToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :class_year, :string, default: "N/A"
    add_column :events, :ideal_m1, :integer, default: 0
    add_column :events, :ideal_m2, :integer, default: 0
    add_column :events, :ideal_m3, :integer, default: 0
    add_column :events, :ideal_m4, :integer, default: 0
  end
end
