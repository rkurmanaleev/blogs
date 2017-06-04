require "rails_helper"

feature "As authenticated User, I can see any user's post" do
  include_context "current user signed in"
  let!(:posts) { create_list(:post, 15, user: current_user) }
  let(:last_post) { posts.last }
  let(:first_post) { posts.first }

  before { visit user_path(current_user) }

  scenario "All posts of user", js: true do
    click_on "See User's Posts"

    expect(current_path).to eq user_posts_path(current_user)
    expect(page).not_to have_content first_post.title
    expect(page).to have_content last_post.title
    expect(page).to have_css(".post", 10)
  end

  scenario "Statistics" do
    expect(page).to have_content "Total Posts: #{current_user.posts.count}"
    expect(page).to have_content "Total Comments: #{current_user.comments.count}"
  end
end
