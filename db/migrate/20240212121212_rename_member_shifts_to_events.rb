class RenameMemberShiftsToEvents < ActiveRecord::Migration[7.0]
  def change
    rename_table :member_shifts, :events
  end
end
