require "rails_helper"

feature "See any user's posts" do
  include_context "current user signed in"
  let!(:post) { create(:post, user: current_user) }

  scenario "As authenticated User" do
    visit user_path(current_user)

    expect(page).to have_content post.title
    expect(page).to have_content post.content
  end
end
