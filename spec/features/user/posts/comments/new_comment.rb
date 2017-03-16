include "rails_helper"

feature "As user I want to create new comment" do
  include_context "current user signed in"
  let!(:post) { create(:post, user: user) }

  scenario "to a post using form at the bottom of post page", js: true do
    visit post_path(post)
    expect(page).to have_content "Leave the comment"

    fill_in "New comment", with: "Awesome blog and the post!"
    click_on "Save Comment"

    expect(page).to have_content "Awesome blog and the post!"
  end

end
