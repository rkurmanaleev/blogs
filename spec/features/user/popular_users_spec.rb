require "rails_helper"

feature "Popular Users" do
  include_context "current user signed in"
  let!(:top_user) { create(:user, posts_count: 1) }
  let(:popular_users_div) { ".popular-users" }

  scenario "User can see Users with more than 0 posts" do
    visit users_path

    within popular_users_div do
      expect(page).not_to have_content current_user.full_name

      expect(page).to have_content(top_user.full_name)
      expect(page).to have_content(top_user.posts_count)
    end
  end
end
