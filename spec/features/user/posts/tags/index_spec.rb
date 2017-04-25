require "rails_helper"

feature "As the User I would like to see the tags I left" do
  context "both in" do
    include_context "current user signed in"
    include_context "post with tags"

    scenario "post#index page" do
      visit posts_path

      expect(page).to have_tags_on_the_page
    end

    scenario "post#show page" do
      visit post_path(post)

      expect(page).to have_tags_on_the_page
    end
  end
end
