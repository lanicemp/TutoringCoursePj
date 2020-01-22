class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :assignment_name
      t.string :description
      t.string :submission

      t.timestamps
    end
  end
end
