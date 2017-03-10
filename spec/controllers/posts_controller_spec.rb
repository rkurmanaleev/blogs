require "rails_helper"

describe PostsController, type: :controller do

  describe "#index" do
    let(:user) { create(:user) }
    let(:posts) { create_list(:post, 14, user: user) }

    before { sign_in(user) }

    it "renders index" do
      get :index
      expect(response).to render_template :index
    end

    it "lists posts" do
      get :index
      expect(assigns(:posts)).to match_array(user.posts.last(10))
    end
  end
end
