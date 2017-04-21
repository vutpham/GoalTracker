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
      expect{ User.find_by_credentials(name: 'name') }.to raise_error("Must provide password")
      expect{ User.find_by_credentials(password: 'password') }.to raise_error("Must provide user_name")
    end
    it "should return a user" do
      expect(User.find_by_credentials(name: 'SuccessGuy', password: 'password')).to be(User.first)
    end
  end
end
