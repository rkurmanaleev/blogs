require "rails_helper"

feature "As user I want to view my previous post with comments" do
  include_context "current user signed in"
  let!(:post) { create(:post, user: current_user, title: "The post to show") }

  context "Route behaviour" do
    scenario "via link from home_page" do
      visit posts_path
      expect(page).to have_content post.title
      click_on "The post to show"

      expect(current_path).to eq post_path(post)
      expect(page).to have_content post.content
    end

    scenario "via direct link" do
      visit post_path(post)

      expect(current_path).to eq post_path(post)
      expect(page).to have_content post.content
    end
  end

  context "I can see comments" do
    let!(:comment) { create(:comment, user: current_user, post: post) }

    scenario "to each post" do
      visit post_path(post)

      within ".posts-comments" do
        expect(page).to have_content comment.content
      end
    end
  end
end
