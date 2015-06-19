# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string
#  email       :string
#  avatar      :string
#  last_active :datetime
#  alumni      :boolean
#  admin       :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ActiveRecord::Base
  belongs_to :group
  has_many :posts
end
