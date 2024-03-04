class RemoveClassYearFromMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :class_year, :string
    remove_column :events, :ideal_officers, :integer
  end
end
