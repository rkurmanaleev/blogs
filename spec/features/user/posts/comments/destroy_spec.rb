require "rails_helper"

feature "User can delete comments" do
  include_context "current user signed in"
  include_context "post with comment"

  context "Owner deletes the comment" do
    scenario "successfully", js: true do
      visit post_path(post)

      click_on "Delete it?"
      expect(page).not_to have_content comment.content
      expect(page).to have_content "No comments yet..."
    end
  end

  context "User can't tries deletes some other user's comment" do
    let(:another_user) { create(:user) }
    before { login_as another_user }

    scenario "and fails" do
      visit post_path(post)

      expect(page).not_to have_content "Delete it?"
    end
  end
end
