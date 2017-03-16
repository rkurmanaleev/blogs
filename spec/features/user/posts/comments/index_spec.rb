require "rails_helper"

feature "User sees sorted comments under the post" do
  include_context "current user signed in"
  include_context "post with comments"

  scenario "10 last comments sorted by creation date" do
    visit post_path(post)

    expect(page).to have_content comment.content
  end
end
