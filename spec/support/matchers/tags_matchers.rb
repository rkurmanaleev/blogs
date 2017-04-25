RSpec::Matchers.define :have_tags_on_the_page do
  match do
    post.tag_list.each do |tag|
      expect(page).to have_content tag
    end
  end
end
