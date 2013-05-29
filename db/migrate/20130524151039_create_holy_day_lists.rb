class CreateHolyDayLists < ActiveRecord::Migration
  def change
    create_table :holy_day_lists do |t|
      t.string :name

      t.timestamps
    end

    add_column :users, :holy_day_list_id, :integer
    add_index :users, :holy_day_list_id
  end
end
