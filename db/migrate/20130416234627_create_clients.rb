class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :skype_id

      t.timestamps
    end
  end
end
