class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.integer :discussion_id
      t.integer :member_id

      t.timestamps
    end
  end
end
