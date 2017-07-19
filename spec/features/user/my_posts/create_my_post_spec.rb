require "rails_helper"

feature "Create a Post" do
  include_context "current user signed in"
  let(:post_attributes) { attributes_for(:post) }

  before { visit new_my_post_path }

  scenario "User creates a post with a title" do
    fill_form_and_submit(:post, post_attributes)

    expect(current_path).to eq post_path(Post.last)
    expect(page).to have_content "Post was successfully created."
  end

  scenario "User created a post without a title" do
    fill_form_and_submit(:post, post_attributes.except(:title))

    expect(current_path).to eq my_posts_path
    expect(page).to have_content "Titlecan't be blank"
  end
end
