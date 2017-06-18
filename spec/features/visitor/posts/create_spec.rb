require "rails_helper"

feature "Create a new post" do
  scenario "Guest can't create a post being unathorized" do
    visit new_my_post_path

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
