require "rails_helper"

describe PostsController do
  describe "#index" do
    let(:user) { create(:user) }
    let(:posts) { create_pair(:post, user: user) }

    before do
      sign_in(user)
      get :index
    end

    it "returns 200 status" do
      expect(response.status).to eq 200
    end

    it "renders index" do
      expect(response).to render_template :index
    end

    it "lists posts" do
      expect(controller.posts).to match_array(posts)
    end
  end
end
