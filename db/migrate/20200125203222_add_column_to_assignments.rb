class AddColumnToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :q_1, :string
    add_column :assignments, :q_2, :string
    add_column :assignments, :q_3, :string
  end
end
