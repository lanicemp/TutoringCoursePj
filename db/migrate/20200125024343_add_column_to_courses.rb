class AddColumnToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :teacher_id, :string
  end
end
