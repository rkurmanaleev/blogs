shared_context "post with tags" do
  let!(:post) { create(:post, user: current_user, tag_list: "Test, Awesome") }
end
