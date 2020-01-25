class ChangeForeignKeysToBigint < ActiveRecord::Migration[6.0]
  def change
    change_column :courses, :teacher_id, :bigint 
    change_column :enrollments, :user_id, :bigint 
    change_column :enrollments, :course_id, :bigint 
    change_column :submissions, :assignment_id, :bigint
    change_column :submissions, :user_id, :bigint
  end
end
