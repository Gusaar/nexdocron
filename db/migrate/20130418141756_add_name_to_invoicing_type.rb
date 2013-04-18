class AddNameToInvoicingType < ActiveRecord::Migration
  def change
    add_column :invoicing_types, :name, :string
    
    add_index :invoicing_types, :name
  end
end
