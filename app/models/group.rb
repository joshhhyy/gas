# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  avatar     :string
#  instructor :string
#

class Group < ActiveRecord::Base
  has_many :users
  has_many :quotes
end

