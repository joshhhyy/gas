# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  avatar          :string
#  last_active     :datetime
#  alumni          :boolean
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  group_id        :integer
#

class User < ActiveRecord::Base
  belongs_to :group
  has_many :posts
  has_secure_password
  validates :email, :presence => true
  validates :email, :uniqueness => true
end
