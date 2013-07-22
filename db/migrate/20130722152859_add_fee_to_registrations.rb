class AddFeeToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :fee, :integer
  end
end
