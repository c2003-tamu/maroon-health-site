class CreateMedicationTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :medication_transactions do |t|
      t.references :medication, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
