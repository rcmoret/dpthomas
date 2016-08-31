class AddOrderToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :priority, :integer
  end
end
