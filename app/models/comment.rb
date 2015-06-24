# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  post_id    :integer
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end
