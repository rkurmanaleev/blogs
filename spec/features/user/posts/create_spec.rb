require "rails_helper"

feature "User creates a Post" do
  include_context "current user signed in"

  def fill_new_post_attributes(title1 = "Some cool title")
    visit new_post_path
    fill_in "Title", with: title1
    fill_in "Content", with: "Some kind of content for test purposes"
    click_on "Create Post"
  end

  scenario "with valid attributes" do
    fill_new_post_attributes

    expect(current_path).to eq post_path(Post.last)
    expect(page).to have_content "Post was successfully created."
  end

  scenario "with invalid attributes" do
    fill_new_post_attributes(nil)

    expect(current_path).to eq posts_path
    expect(page).to have_content "Titlecan't be blank"
  end
end
