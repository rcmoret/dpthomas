class AddSubHeadingColumnToPages < ActiveRecord::Migration
  def change
    add_column :pages, :sub_heading, :string
  end
end
