class CreateAnnouncementTable < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :announcement

      t.timestamps
    end
  end

end
