class CreateTableForMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :position_title
      t.text :biography
      t.string :email

      t.timestamps
    end
  end

end
