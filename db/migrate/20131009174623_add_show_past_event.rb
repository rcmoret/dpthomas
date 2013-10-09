class AddShowPastEvent < ActiveRecord::Migration
  def change
    add_column :events, :show_past_event, :boolean, default: false
  end
end
