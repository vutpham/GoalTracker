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

end
