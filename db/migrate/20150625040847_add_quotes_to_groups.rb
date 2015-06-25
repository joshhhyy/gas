class AddQuotesToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :quotes, :text
  end
end
