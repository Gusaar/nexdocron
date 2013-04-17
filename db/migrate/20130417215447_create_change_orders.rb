class CreateChangeOrders < ActiveRecord::Migration
  def change
    create_table :change_orders do |t|
      t.decimal :hours, precision: 5, scale: 2
      t.datetime :date
      t.datetime :end_date
      t.integer :project_id

      t.timestamps
    end
  end
end
