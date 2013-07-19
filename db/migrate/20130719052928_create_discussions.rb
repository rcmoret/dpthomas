class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :topic
      t.text :content
      t.integer :member_id

      t.timestamps
    end

  end
end
