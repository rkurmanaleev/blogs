require "rails_helper"

feature "As user I want to view my previous post with comments" do
  include_context "current user signed in"
  let!(:post) { create(:post, user: current_user) }

  RSpec::Matchers.define :have_posts_content_and_title_on_post_page do
    match do
      eq post_path(post)
      have_content post.title
      have_content post.content
    end
  end

  def visit_posts_path_and_click_on_title
    visit posts_path
    click_on post.title
  end

  context "Route behaviour" do
    scenario "via link from home_page" do
      visit_posts_path_and_click_on_title

      expect(page).to have_posts_content_and_title_on_post_page
    end

    scenario "via direct link" do
      visit post_path(post)

      expect(page).to have_posts_content_and_title_on_post_page
    end
  end
end
