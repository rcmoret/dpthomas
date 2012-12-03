class Dropunneededtables < ActiveRecord::Migration
  def up
    drop_table :ckeditor_assets
    drop_table :discussions
    drop_table :members
    drop_table :replies
    drop_table :users
  end

  def down
    create_table :ckeditor_assets do |t|
      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.integer :assetable_id
      t.string :assestabe_type
      t.string :type
      t.integer :width
      t.integer :height
    end

    create_table :discussions do |t|
      t.string :topic
      t.text :content
      t.string :author
      t.string :user_id
    end

    create_table :members do |t|
      t.string :user_id
      t.string :member_name
      t.text :profile
      t.string :image
    end

    create_table :replies do |t|
      t.integer :discussion_id
      t.string :integer
      t.text :reply
      t.string :author
    end

    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
    end
  end
end
