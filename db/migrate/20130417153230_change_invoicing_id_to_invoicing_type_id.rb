class ChangeInvoicingIdToInvoicingTypeId < ActiveRecord::Migration
  def up
    remove_column :projects, :invoicing_id
    add_column    :projects, :invoicing_type_id, :integer
  end

  def down
    remove_column :projects, :invoicing_type_id
    add_column    :projects, :invoicing_id, :integer
  end
end
