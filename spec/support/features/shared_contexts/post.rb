shared_context "current user's post" do
  let(:post) { create(:post, user: current_user) }
end

shared_context "post attributes" do
  let(:post_attributes) { attributes_for(:post) }
  let(:invalid_post_attributes) { attributes_for(:post, title: "") }
end
