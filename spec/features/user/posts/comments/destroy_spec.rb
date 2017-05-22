require "rails_helper"

feature "Delete the comment" do
  include_context "current user signed in"
  include_context "post with comment"
  let(:another_user) { create(:user) }

  scenario "successfully" do
    visit post_path(post)

    within(".comment[data-element='#{comment.id}']") do
      click_on "Delete comment?"
    end

    expect(page).not_to have_content comment.content
    expect(page).to have_content "No comments yet..."
  end

  describe "as another user" do
    before { login_as(another_user) }

    scenario "unsuccessfully" do
      visit post_path(post)

      within(".comment[data-element='#{comment.id}']") do
        expect(page).to have_content comment.content
        expect(page).not_to have_content "Delete comment?"
      end
    end
  end
end
