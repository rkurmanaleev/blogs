RSpec::Matchers.define :have_posts_content_and_title_on_post_page do
  match do
    eq post_path(post)
    have_content post.title
    have_content post.content
  end
end

RSpec::Matchers.define :have_last_10_posts_paginated do
  match do
    within ".col-sx-9" do
      expect(page).to have_css(".post", count: 10)
      expect(page).to have_content posts.last.title
      expect(page).to have_content posts[2].title
      expect(page).not_to have_content posts.first.title
    end
  end
end
