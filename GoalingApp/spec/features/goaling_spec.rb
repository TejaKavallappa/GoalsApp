require 'spec_helper'
require 'rails_helper'

feature "have adding goal" do
  before :each do
    signup_testing_username
  end

  it "has a new goal page" do
    visit user_url(1)
    expect(page).to have_content "New Goal"
  end

  it "shows all goals" do
    visit user_url(1)
    fill_in 'Goal', with: "write tests"
    click_on 'New Goal'

    expect(page).to have_content 'write tests'
    expect(current_path).to eq("/users/1")
  end
end

feature "updating goal" do

  it "shows goal on user page after adding goal" do
    generate_goal
    expect(page).to have_content 'Boring goal'
    expect(page).to have_submit_button('Edit')
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
