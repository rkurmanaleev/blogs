shared_context "post with comment" do
  let!(:post) { create(:post, user: current_user) }
  let!(:comment) { create(:comment, user: current_user, post: post) }
end
