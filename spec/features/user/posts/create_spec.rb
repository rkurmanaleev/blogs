require "rails_helper"

feature "User creates a Post" do
  include_context "current user signed in"

  def fill_new_post_attributes(title)
    visit root_path
    click_on "Create a new Post"
    fill_in "Title", with: title
    fill_in "Content", with: "Some kind of content for test purposes"
    click_on "Create Post"
  end

  scenario "with valid attributes" do
    fill_new_post_attributes("Some cool title")

    expect(current_path).to eq posts_path
    expect(page).to have_content "Post has been successfully created."
  end

  scenario "with invalid attributes" do
    fill_new_post_attributes(nil)

    expect(current_path).to eq posts_path
    expect(page).to have_content "Title can't be blank"
  end
end
