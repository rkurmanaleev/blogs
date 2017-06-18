require "rails_helper"

feature "Show the post" do
  include_context "current user signed in"
  include_context "current user's post"

  scenario "User sees the post" do
    visit post_path(post)

    expect(page).to have_posts_content_and_title_on_post_page
  end
end
