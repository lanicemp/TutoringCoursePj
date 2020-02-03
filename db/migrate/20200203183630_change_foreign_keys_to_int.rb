class ChangeForeignKeysToInt < ActiveRecord::Migration[6.0]
  def change

    change_column :courses, :teacher_id, :int  
    change_column :enrollments, :course_id, :int  
    change_column :submissions, :user_id, :int
  end
end
