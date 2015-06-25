class ChangeLinkedinFromUsernameToUrl < ActiveRecord::Migration
  def change
    remove_column :users, :linkedin_username
    add_column :users, :linkedin_profile, :string
  end
end
