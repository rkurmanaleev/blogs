require "rails_helper"

feature "Edit the post" do
  include_context "current user signed in"
  include_context "current user's post"
  include_context "post attributes"
  let(:another_user) { create(:user) }

  scenario "Owner edits the post" do
    visit edit_my_post_path(post)

    fill_form_and_submit(:post, :edit, post_attributes)

    expect(current_path).to eq post_path(post)
    expect(page).to have_content "Post was successfully updated."
  end

  scenario "Owner edits the post with no title provided" do
    visit edit_my_post_path(post)

    fill_form_and_submit(:post, :edit, invalid_post_attributes)

    expect(current_path).to eq my_post_path(post)
    expect(page).to have_content "Titlecan't be blank"
  end

  scenario "Another user tries to edit the post" do
    login_as(another_user)
    visit edit_my_post_path(post)

    expect(current_path).to eq root_path
  end
end
