require "rails_helper"

feature "User can see other user's posts" do
  include_context "current user signed in"
  let(:posts) { create_list(:post, 11, user: current_user) }

  scenario "User can see other User's 10 posts on the 1st page" do
    visit user_posts_path(current_user)

    expect(page).to have_last_10_posts_paginated
  end
end
