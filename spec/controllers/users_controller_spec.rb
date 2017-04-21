require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "users#index" do
    it "should render the index view"
  end

  describe "users#new" do
    it "should render new page"
  end

  describe "users#create"do
    it "should add a new user to the database"
    it "should redirect to user_url upon creation"
    it "should render an error message if user creation failed"
    it "should redirect to new_user_url if user creation failed"
  end

  describe "users#show" do
    it "should render user_url page"
  end

  describe "users#edit" do
    it "should render edit page"
  end
end
