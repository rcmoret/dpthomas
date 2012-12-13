class AddConfirmationToMembers < ActiveRecord::Migration
  def up
    change_table(:members) do |t|
      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
    end
  end

  def down
    change_table(:members) do |t|
      t.remove :confirmation_token
      t.remove :confirmed_at
      t.remove :confirmation_sent_at
      t.remove :unconfirmed_email # Only if using reconfirmable
    end
  end
end
