require "rails_helper"

feature "As the User I'd like to see all posts by tag" do
  include_context "current user signed in"
  include_context "post with tags"
  let!(:another_post) { create(:post, user: current_user, tag_list: "Test") }

  scenario "by existing tag" do
    visit posts_by_tag_path("Test")

    expect(page).to have_content post.content
    expect(page).to have_content another_post.content
  end

  scenario "by unexisting tag" do
    visit posts_by_tag_path("12345678")

    expect(page).to have_content "No posts by your tag 12345678"
  end
end
