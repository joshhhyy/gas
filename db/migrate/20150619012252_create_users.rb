class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.datetime :last_active
      t.boolean :alumni
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
