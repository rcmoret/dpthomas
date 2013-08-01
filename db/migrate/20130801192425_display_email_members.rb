class DisplayEmailMembers < ActiveRecord::Migration
  def change
    add_column :members, :public_email, :boolean, default: true
    Member.all.each(&:save)
  end
end
