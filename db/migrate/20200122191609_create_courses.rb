class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :description
      t.boolean :submission

      t.timestamps
    end
  end
end
