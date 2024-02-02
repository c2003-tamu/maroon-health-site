class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.integer :stock
      t.text :notes

      t.timestamps
    end
  end
end
