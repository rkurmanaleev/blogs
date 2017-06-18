require "rails_helper"

feature "Delete a post" do
  include_context "current user signed in"
  include_context "current user's post"
  let(:another_user) { create(:user) }

  scenario "Owner deletes the post" do
    visit post_path(post)
    click_on "Delete the Post"

    expect(current_path).to eq my_posts_path
    expect(page).to have_content "Post was successfully destroyed."
  end

  scenario "Another User deletes the post" do
    login_as another_user
    visit post_path(post)

    expect(page).not_to have_content "Delete the Post"
  end
end
