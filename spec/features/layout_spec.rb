require "rails_helper"

feature "Layout Specs" do
  include_context "current user signed in"

  describe "default behaviour" do
    scenario "no Recent Posts&Comments" do
      visit root_path

      expect(page).not_to have_css ".recent-posts"
      expect(page).not_to have_content "Recent Posts"
      expect(page).not_to have_css ".recent-comments"
      expect(page).not_to have_content "Recent Comments"
    end
  end

  describe "non-default behaviour" do
    let!(:post) { create(:post, user: current_user) }
    let!(:comment) { create(:comment, user: current_user, post: post) }

    scenario "with Recent Posts&Comments" do
      visit root_path

      expect(page).to have_content "Recent Posts"
      expect(page).to have_content post.title
      expect(page).to have_content "Recent Comments"
      expect(page).to have_content comment.post.title
    end
  end
end
