class ChangePageContentColumn < ActiveRecord::Migration
  def up
    remove_column :pages, :content
    add_column :pages, :content, :text
  end

  def down
    remove_column :pages, :content
    add_column :pages, :content, :string
  end
end
