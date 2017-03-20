require "rails_helper"

feature "See any user's posts" do
  include_context "current user signed in"
  let!(:posts) { create_list(:post, 12, user: current_user) }
  let(:first_post) { posts.first }
  let(:last_post) { posts.last }

  context "Default behavior - recent 10 posts" do
    scenario "As authenticated User" do
      visit user_path(current_user)

      expect(page).to have_content last_post.title
      expect(page).not_to have_content first_post.title
    end
  end

  context "All posts" do
    scenario "As authenticated User" do
      visit user_path(current_user)
      click_on "See all posts"

      expect(page).to have_content first_post.title
      expect(page).to have_content last_post.title
    end
  end
end
