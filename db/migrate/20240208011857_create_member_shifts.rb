class CreateMemberShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :member_shifts do |t|
      t.integer :event_id
      t.integer :member_id

      t.timestamps
    end
  end
end
