class AddM1M2AndM3M4VolunteersToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :m1_m2_volunteers, :integer
    add_column :events, :m3_m4_volunteers, :integer
  end
end
