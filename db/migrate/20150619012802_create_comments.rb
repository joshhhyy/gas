class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :content
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
