require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  it "shows username on the homepage after signup" do
    visit new_user_url
    fill_in 'Username', with: "testing_username"
    fill_in 'Password', with: "biscuits"
    click_on "Create User"
    expect(page).to have_content 'testing_username'
    expect(current_path).to eq("/users/1")
  end
end

feature "logging in" do

  it "shows username on the homepage after login" do
    signup_testing_username
    visit new_session_url
    fill_in 'Username', with: "testing_username"
    fill_in 'Password', with: "biscuits"
    click_on "Sign In"
    expect(page).to have_content 'testing_username'
    expect(current_path).to eq("/users/1")
  end
end

feature "logging out" do

  it "begins with logged out state" do
    visit new_session_url
    expect(page).to have_no_content 'Log Out'
  end

  it "doesn't show username on the homepage after logout" do
    signup_testing_username
    click_button('Log Out')
    expect(page).to have_no_content 'testing_username'
  end

end
