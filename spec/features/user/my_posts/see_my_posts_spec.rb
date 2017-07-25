require "rails_helper"

feature "See the Posts" do
  include_context "current user signed in"
  let(:posts) { create_list(:post, 11, user: current_user) }

  scenario "User can see last 10 of his/her on the first page" do
    visit root_path

    expect(page).to have_last_10_posts_paginated
  end
end
