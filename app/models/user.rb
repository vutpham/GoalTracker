class User < ApplicationRecord
  attr_reader :password

  validates :name, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  def password=(password)
    @password = password

    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  

  def self.find_by_credentials(name, password)
    raise "Must provide password" if password.length == 0
    raise "Must provide user_name" if name.length == 0

    user = User.find_by(name: name)
    # return user if BCrypt::Password.new(user.password_digest).is_password?(password)
     return user if user.is_password?(password)
    nil
  end

end
