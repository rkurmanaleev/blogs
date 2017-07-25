require "rails_helper"

feature "Edit a Post" do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  scenario "Guest can't create a post and fails with access denied" do
    visit edit_my_post_path(post)

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content "You need to sign in or sign up before continuing."
  end
end
