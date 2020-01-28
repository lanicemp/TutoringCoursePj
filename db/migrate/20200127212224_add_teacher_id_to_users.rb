class AddTeacherIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :teacher_id, :integer
  end
end
