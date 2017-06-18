require "rails_helper"

describe PostsController do
  let(:user) { create(:user) }

  describe "GET #index" do
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

  describe "GET #show" do
    let(:post) { create(:post, user: user) }

    before do
      sign_in(user)
      get :show, params: { id: post }
    end

    it "renders 200 status" do
      expect(response.status).to eq 200
    end

    it "renders :show template" do
      expect(response).to render_template :show
    end

    it "shows the post" do
      expect(controller.posts.first.content).to eq(post.content)
    end
  end
end
