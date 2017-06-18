require "rails_helper"

feature "User creates a Post" do
  include_context "current user signed in"
  let(:post_attributes) { attributes_for(:post) }

  before { visit new_my_post_path }

  scenario "with title" do
    fill_form_and_submit(:post, post_attributes)

    expect(current_path).to eq post_path(Post.last)
    expect(page).to have_content "Post was successfully created."
  end

  scenario "with no title" do
    fill_form_and_submit(:post, post_attributes.except(:title))

    expect(current_path).to eq my_posts_path
    expect(page).to have_content "Titlecan't be blank"
  end
end
