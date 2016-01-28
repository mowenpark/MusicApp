class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  after_initialize :reset_session_token!

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    save!
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
