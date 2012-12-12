class CreateEmailLists < ActiveRecord::Migration
  def change
    create_table :email_lists do |t|
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.timestamps
    end
  end
end
