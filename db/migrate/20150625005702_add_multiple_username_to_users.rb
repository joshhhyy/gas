class AddMultipleUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :linkedin_username, :string
    add_column :users, :twitter_username, :string
    add_column :users, :slack_username, :string
  end
end
