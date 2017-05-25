require "rails_helper"

feature "When I visit users#index I see" do
  include_context "current user signed in"

  describe "call2action" do
    scenario "when there are no users with posts" do
      visit users_path

      expect(page).to have_content "Create new Post"
    end
  end

  describe "list of users" do
    let!(:another_user) { create(:user, posts_count: 2) }
    let!(:top_user) { create(:user, posts_count: 5) }
    let(:users) { [top_user, another_user] }

    scenario "with more than 0 posts" do
      visit users_path

      within ".popular-users" do
        expect(page).not_to have_content "Create new Post"
        expect(page).not_to have_content current_user.full_name

        users.each do |user|
          expect(page).to have_content(user.full_name)
          expect(page).to have_content(user.posts_count)
        end
      end
    end
  end
end
