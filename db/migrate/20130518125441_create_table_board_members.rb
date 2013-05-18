class CreateTableBoardMembers < ActiveRecord::Migration
  def change
    create_table :board_members do |t|
      t.string :name
      t.string :email
      t.string :profile_image
      t.string :biography

      t.timestamps
    end
  end
end
