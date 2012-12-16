class Addinfotomembers < ActiveRecord::Migration
  def change
    add_column :members, :name, :string
    add_column :members, :profile, :text
    add_column :members, :title, :string
  end

end
