require "rails_helper"

feature "See any user's post" do
  include_context "current user signed in"
  let(:posts) { create_list(:post, 11, user: current_user) }

  scenario "User can see stats of any user" do
    visit user_path(current_user)

    expect(page).to have_content current_user.full_name
    expect(page).to have_content "Total Posts: #{current_user.posts.count}"
    expect(page).to have_content "Total Comments: #{current_user.comments.count}"
  end
end
