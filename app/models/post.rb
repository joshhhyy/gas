# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  subtitle   :string
#  content    :text
#  tags       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  cl_id      :string
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments


  def self.search(search)
    Post.where( [
      "title ILIKE :query or
       content ILIKE :query or
       tags ILIKE :query or
       subtitle ILIKE :query
      ",
      { :query => search }
    ] )
  end

end