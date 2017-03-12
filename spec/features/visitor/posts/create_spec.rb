require "rails_helper"

feature "Guest is not allowed to create a new post" do
  scenario "Doesn't see a link to create a post" do
    visit root_path

    expect(page).not_to have_content "Create a new Post"
  end

  scenario "Can't create a new post having direct link" do
    visit new_post_path

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
