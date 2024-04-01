class CreateCalendarEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :calendar_events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false

      t.timestamps
    end
  end
end
