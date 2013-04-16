class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :name
      t.decimal :total_hours, precision: 5, scale: 2, default: 0
      t.integer :client_id
      t.integer :invoicing_id

      t.timestamps
    end
  end
end
