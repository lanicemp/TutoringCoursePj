class AddColumnCourseIdToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :course_id, :integer
  end
end
