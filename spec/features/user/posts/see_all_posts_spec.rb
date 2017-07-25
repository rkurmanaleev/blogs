require "rails_helper"

feature "List posts of ALL users" do
  include_context "current user signed in"
  let(:posts) { create_list(:post, 11, user: current_user) }

  scenario "User sees recent 10 posts on the first page" do
    visit posts_path

    expect(page).to have_last_10_posts_paginated
  end
end
