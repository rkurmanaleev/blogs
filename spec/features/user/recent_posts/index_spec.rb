require "rails_helper"

feature "As User when I visit user/:id/posts/recent_posts" do
  include_context "current user signed in"
  let!(:posts) { create_list(:post, 15, user: current_user) }

  scenario "I see only recent user's posts" do
    visit user_posts_recent_posts_path(current_user)

    within ".col-sx-9" do
      expect(page).to have_content posts.last.title
      expect(page).to have_content posts[6].title
      expect(page).not_to have_content posts.first.title
    end
  end
end
