require "rails_helper"

feature "List recent posts" do
  context "Authorised User" do
    include_context "current user signed in"
    let!(:posts) { create_list(:post, 15, user: current_user) }

    scenario "sees 10 last posts" do
      visit posts_path
      posts.last(10).each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.content)
      end
    end
  end

  context "Guest" do
    scenario "doesn't see any posts" do
      visit posts_path
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
end
