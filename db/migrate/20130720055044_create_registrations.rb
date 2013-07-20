class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :event_id
      t.string :email
      t.integer :adults
      t.integer :children
      t.string :additional_info

      t.timestamps
    end
  end
end
