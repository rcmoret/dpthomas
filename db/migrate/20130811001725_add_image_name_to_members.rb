class AddImageNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :image_name, :string
  end
end
