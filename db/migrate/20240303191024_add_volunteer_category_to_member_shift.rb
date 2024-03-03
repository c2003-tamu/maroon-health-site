class AddVolunteerCategoryToMemberShift < ActiveRecord::Migration[7.0]
  def change
    add_column :member_shifts, :volunteer_category, :string
  end
end
