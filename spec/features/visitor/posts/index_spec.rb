require "rails_helper"

feature "List recent posts" do
  context "Guest" do
    scenario "doesn't see any posts" do
      visit posts_path
      expect(page).to have_content "You need to sign in or sign up before continuing."
    end
  end
end
