class AddColumnToSubmissions < ActiveRecord::Migration[6.0]
  def change
    add_column :submissions, :a_1, :string
    add_column :submissions, :a_2, :string
    add_column :submissions, :a_3, :string
  end
end
