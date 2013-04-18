class AddMissingIndexes < ActiveRecord::Migration
  def up
    add_index :projects, :name
    add_index :projects, :client_id
    add_index :projects, :invoicing_type_id

    add_index :clients, :name
    add_index :clients, :contact_name

    add_index :change_orders, :project_id

    add_index :user_projects, :user_id
    add_index :user_projects, :project_id

    add_index :user_types, :name
  end

  def down
    remove_index :projects, :name
    remove_index :projects, :client_id
    remove_index :projects, :invoicing_type_id

    remove_index :clients, :name
    remove_index :clients, :contact_name

    remove_index :change_orders, :project_id

    remove_index :user_projects, :user_id
    remove_index :user_projects, :project_id

    remove_index :user_types, :name
  end
end
