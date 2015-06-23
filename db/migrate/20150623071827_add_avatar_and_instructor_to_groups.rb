class AddAvatarAndInstructorToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :avatar, :string
    add_column :groups, :instructor, :string
  end
end
