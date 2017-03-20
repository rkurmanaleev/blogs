require "rails_helper"

feature "As user I want to create new comment to the post at the bottom with" do
  include_context "current user signed in"
  let!(:post) { create(:post, user: current_user) }

  def fill_form(title = nil)
    visit post_path(post)
    fill_in "content-field", with: title
    click_on "Save Comment"
  end

  scenario "valid params", js: true do
    fill_form("Awesome blog and the post!")

    expect(page).not_to have_content "No comments yet..."
    expect(page).to have_content "Awesome blog and the post!"
    expect(page).to have_content "Successfully created a comment"
  end

  scenario "invalid params", js: true do
    fill_form

    expect(page).to have_content "No comments yet..."
    expect(page).not_to have_content "Awesome blog and the post!"
    expect(page).to have_content "Text field couldn't be blank!"
  end
end
