class AddRegistrationFeeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :has_registration, :boolean
    add_column :events, :adult_fee, :integer
    add_column :events, :child_fee, :integer
  end
end
