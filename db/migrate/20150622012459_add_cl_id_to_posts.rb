class AddClIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cl_id, :string
  end
end
