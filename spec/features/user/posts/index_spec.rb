require "rails_helper"

feature "List recent posts" do
  include_context "current user signed in"

  context "User sees all the posts" do
    let!(:posts) { create_list(:post, 15, user: current_user) }

    before { visit posts_path }

    scenario "sees 10 last posts on the 1st page" do
      within ".col-sx-9" do
        expect(page).to have_css(".post", count: 10)
        expect(page).to have_content posts.last.title
        expect(page).to have_content posts[5].title
        expect(page).not_to have_content posts.first.title
      end
    end
  end

  context "User has no posts" do
    scenario "sees a call2action" do
      visit posts_path

      expect(page).to have_content("Sorry, we don't have any posts yet...")
      expect(page).to have_link("new post", href: new_post_path)
    end
  end
end
