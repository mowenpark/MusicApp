# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  before_save :reset_session_token!

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(email, password)
    if User.find_by(email: email) && User.find_by(email: email).is_password?(password)
      return User.find_by(email: email)
    else
      nil
    end
  end

end
