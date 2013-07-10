class AddSubtitleColumnToEventsTable < ActiveRecord::Migration
  def change
    add_column :events, :subtitle, :string
    add_column :events, :location, :string
    add_column :events, :details, :string
    add_column :events, :activities, :string
  end
end
