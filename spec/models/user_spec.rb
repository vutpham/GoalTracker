require 'rails_helper'
require 'bcrypt'

RSpec.describe User, type: :model do
  subject(:user) {
    User.create(name: 'SuccessGuy',
    password: 'password',
    session_token: "AqnwDefnas" )
  }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe '#find_by_credentials' do
    it 'should be able to take in name and password' do
      expect{ User.find_by_credentials('name', "") }.to raise_error("Must provide password")
      expect{ User.find_by_credentials("", 'password') }.to raise_error("Must provide user_name")
    end
    it "should return a user" do
      User.create(name: 'SuccessGuy',
      password: 'password',
      session_token: "AqnwDefnas" )

      expect(User.find_by_credentials('SuccessGuy', 'password')).to eq(User.first)
    end
  end

  describe "#is_password?" do
    subject("user") {
      User.new(name: 'SuccessGuy',
      password: 'password',
      session_token: "AqnwDefnas" )
    }
    it 'should return true if password is correct' do
      expect(user.is_password?('password')).to eq(true)
    end
    it 'should return false if password is incorrect' do
      expect((user).is_password?('wrong_password')).to eq(false)
    end
  end
  
  describe "#generate_session_token" do
    it 'should create a new session_token' do
      token = user.session_token
      user.generate_session_token
      expect(user.session_token).not_to eq(token)
    end

  end
end
