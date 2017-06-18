require "rails_helper"

feature "Create a comment" do
  include_context "current user signed in"
  include_context "current user's post"
  let(:clean_form?) { page.has_field?("comment_content", with: "") }

  before { visit post_path(post) }

  scenario "User creates the comment with content", js: true do
    fill_in("comment_content", with: "Some new and fresh comment")

    click_on "Save the Comment"

    expect(clean_form?).to eq true
    expect(page).to have_content "Some new and fresh comment"
    expect(page).to have_content "Total comments 1"
  end

  scenario "User creates the comment without content", js: true do
    fill_in "comment_content", with: nil

    click_on "Save the Comment"

    expect(page).to have_content "can't be blank"
    expect(page).to have_content "No comments yet..."
  end
end
