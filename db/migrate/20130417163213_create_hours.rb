class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.decimal :total_hours, precision: 5, scale: 2
      t.text :tasks_description
      t.datetime :date
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
