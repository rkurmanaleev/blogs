require "rails_helper"

feature "As User when I visit user/:id/posts/all_posts" do
  include_context "current user signed in"
  let!(:posts) { create_list(:post, 15, user: current_user) }

  scenario "I see ALL of the user's posts" do
    visit user_all_posts_path(current_user)

    within ".col-sx-9" do
      expect(page).to have_content posts.first.title
      expect(page).to have_content posts.last.title
    end
  end
end
