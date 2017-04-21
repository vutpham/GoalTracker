require 'rails_helper'
require 'bcrypt'

RSpec.describe User, type: :model do
  subject(:user) {
    User.create(name: 'SuccessGuy',
    password_digest: BCrypt::Password.create('password'),
    session_token: "AqnwDefnas" )
  }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:session_token) }
end
