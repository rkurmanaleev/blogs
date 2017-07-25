require "rails_helper"

feature "Delete the comment" do
  include_context "current user signed in"
  include_context "post with comment"
  let(:another_user) { create(:user) }
  let(:comment_div) { ".comment[data-element='#{comment.id}']" }

  scenario "Owner deletes the post" do
    visit post_path(post)

    find(comment_div).click_on "Delete comment?"

    expect(page).not_to have_content comment.content
    expect(page).to have_content "No comments yet..."
  end

  scenario "Another User tries to delete the post" do
    login_as(another_user)
    visit post_path(post)

    within(comment_div) do
      expect(page).to have_content comment.content
      expect(page).not_to have_content "Delete comment?"
    end
  end
end
