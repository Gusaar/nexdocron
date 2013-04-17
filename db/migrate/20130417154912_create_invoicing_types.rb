class CreateInvoicingTypes < ActiveRecord::Migration
  def change
    create_table :invoicing_types do |t|
      t.text :description

      t.timestamps
    end
  end
end
