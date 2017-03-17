require "rails_helper"

feature "As user I want to create new comment" do
  include_context "current user signed in"
  let!(:post) { create(:post, user: current_user) }

  scenario "to a post using the form at the bottom of post page", js: true do
    visit post_path(post)
    fill_in "comment_content", with: "Awesome blog and the post!"
    click_on "Save Comment"

    expect(page).to have_content "Awesome blog and the post!"
  end
end
