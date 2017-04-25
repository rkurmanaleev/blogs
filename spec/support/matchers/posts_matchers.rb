RSpec::Matchers.define :have_posts_content_and_title_on_post_page do
  match do
    eq post_path(post)
    have_content post.title
    have_content post.content
  end
end
