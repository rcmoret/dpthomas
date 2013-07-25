class RenameSubtitle < ActiveRecord::Migration
  def change
    add_column :events, :name, :string
    remove_column :events, :subtitle

  end
end
