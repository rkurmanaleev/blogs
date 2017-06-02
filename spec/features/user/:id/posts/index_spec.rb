require "rails_helper"

feature "As User when I visit user/:id/posts/all_posts" do
  include_context "current user signed in"
  let!(:posts) { create_list(:post, 15, user: current_user) }

  describe "I see ALL of the user's posts via paginator" do
    before { visit user_posts_path(current_user) }

    scenario "by default is 10 posts on the 1st page" do
      within ".col-sx-9" do
        expect(page).to have_css(".post", count: 10)
        expect(page).not_to have_content posts.first.title
        expect(page).to have_content posts.last.title
        expect(page).to have_content posts[6].title
      end
    end

    scenario "and other 5 posts in the 2nd page" do
      click_on("Last")

      within ".col-sx-9" do
        expect(page).to have_content posts.first.title
        expect(page).not_to have_content posts.last.title
        expect(page).to have_css(".post", count: 5)
      end
    end
  end
end
