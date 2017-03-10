require "rails_helper"

feature "List recent posts" do
  context "Authorised User" do
    include_context "current user signed in"
    let!(:post) { create(:post, user: current_user) }

    scenario "sees 10 last posts" do
      visit posts_path
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.content)
    end
  end
end
