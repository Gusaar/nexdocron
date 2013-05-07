class AddColourToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :colour, :string
  end
end
