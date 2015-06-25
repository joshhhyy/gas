class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :quote
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
