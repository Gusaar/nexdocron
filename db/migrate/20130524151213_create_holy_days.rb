class CreateHolyDays < ActiveRecord::Migration
  def change
    create_table :holy_days do |t|
      t.date :day
      t.references :holy_day_list

      t.timestamps
    end
    add_index :holy_days, :holy_day_list_id
  end
end
