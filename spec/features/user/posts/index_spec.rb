require "rails_helper"

feature "List recent posts" do
  include_context "current user signed in"

  context "User has posts" do
    let!(:post) { create(:post, user: current_user) }

    scenario "sees 10 last posts" do
      visit posts_path

      expect(page).to have_content(post.title)
      expect(page).to have_content(post.content)
    end
  end

  context "User has no posts" do
    scenario "sees a call2action" do
      visit posts_path

      expect(page).to have_content("Sorry, there are no posts yet...")
      expect(page).to have_link("new post", href: new_post_path)
    end
  end
end
