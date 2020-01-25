class CreateSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :submissions do |t|
      t.string :user_id
      t.string :assignment_id
      t.string :content

      t.timestamps
    end
  end
end
