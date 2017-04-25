require "rails_helper"

feature "As user I want to view my previous post with comments" do
  include_context "current user signed in"
  include_context "post with comment"

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

  context "I can see comments" do
    let(:posts_comments) { find(".posts-comments") }

    scenario "to each post" do
      visit post_path(post)

      expect(posts_comments).to have_content comment.content
    end
  end
end
