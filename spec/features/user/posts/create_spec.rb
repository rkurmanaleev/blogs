require "rails_helper"

feature "User creates a Post" do
  include_context "current user signed in"

  scenario "with valid attributes" do
    visit new_post_path
    fill_in "Title", with: "Test title"
    fill_in "Content", with: "Some kind of content for test purposes"
    click_on "Create Post"

    expect(current_path).to eq posts_path
    expect(page).to have_content "Post has been successfully created."
  end

  scenario "with invalid attributes" do
    visit new_post_path
    fill_in "Title", with: nil
    fill_in "Content", with: "Some kind of a title"
    click_on "Create Post"

    expect(current_path).to eq posts_path
    expect(page).to have_content "Title can't be blank"
  end
end
