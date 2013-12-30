class AddDefaultProjectToUser < ActiveRecord::Migration
  def change
  	add_column :users, :default_project, :integer
  end
end
