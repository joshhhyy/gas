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
#  tagline         :string
#

class User < ActiveRecord::Base
  belongs_to :group
  has_many :posts
  has_secure_password
  validates :email, :presence => true
  validates :email, :uniqueness => true

  def self.search(search)
    search = '%' + search + '%'
    User.where( [
      "name ILIKE :query or
       email ILIKE :query
      ",
      { :query => search }
    ] )
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver 
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
