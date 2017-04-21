require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign up for the Goal Tracker App"
  end

  feature "signing up a user" do
    scenario "shows username on the homepage after signup" do
      visit new_user_url
      fill_in('name', :with => 'name is whatever')
      fill_in('password', :with => 'password')
      click_on('submit')
      expect(page).to have_content('name is whatever')
    end
  end
end

feature "logging in" do
  scenario "shows username on the homepage after login" do
    
  end

end

feature "logging out" do

  scenario "begins with a logged out state"

  scenario "doesn't show username on the homepage after logout"

end
