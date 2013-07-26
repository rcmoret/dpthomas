class RemamePositionTitleOnMember < ActiveRecord::Migration
  def change
    add_column :members, :position, :string
    remove_column :members, :position_title
  end
end
