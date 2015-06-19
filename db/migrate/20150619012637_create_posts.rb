class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :tags
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps null: false
    end
  end
end
