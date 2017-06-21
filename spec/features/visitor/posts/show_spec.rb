require "rails_helper"

feature "See the post" do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  scenario "Guest can't see the post" do
    visit posts_path(post)

    expect(page).not_to have_content post.title
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
