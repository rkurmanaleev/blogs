require "rails_helper"

feature "User can comment the post" do
  include_context "current user signed in"

  let(:post) { create(:post, user: current_user) }

  before { visit post_path(post) }

  scenario "with valid data", js: true do
    fill_in "comment_content", with: "Some new and fresh comment"
    click_on "Save the Comment"

    expect(page.has_field?("comment_content", with: "")).to eq true
    expect(page).to have_content "Some new and fresh comment"
    expect(page).to have_content "Total comments 1"
  end

  scenario "with invalid data", js: true do
    fill_in "comment_content", with: nil

    expect(page.has_button?("Save the Comment", disabled: true)).to eq true

    expect(page).to have_content "No comments yet..."
  end
end
