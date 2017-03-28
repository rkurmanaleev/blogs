require "rails_helper"

feature "As the User I want to be able to delete posts" do
  include_context "current user signed in"
  let(:post) { create(:post, user: current_user) }

  scenario "that belong to me (Owner)" do
    visit post_path(post)
    click_on "Delete the Post"

    expect(current_path).to eq posts_path
    expect(page).to have_content "Post has been successfully deleted."
  end

  context "that belong to Another Users" do
    let(:another_user) { create(:user) }

    before { login_as another_user }

    scenario "that belong to Another Users" do
      visit post_path(post)

      expect(page).not_to have_content "Delete the Post"
    end
  end
end
