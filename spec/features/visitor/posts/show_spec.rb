require "rails_helper"

feature "Guest tries to see the post" do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user, title: "The post to show") }

  scenario "via link from home_page" do
    visit posts_path

    expect(page).not_to have_content post.title
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

  scenario "via direct link" do
    visit posts_path(post)

    expect(page).not_to have_content post.title
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
