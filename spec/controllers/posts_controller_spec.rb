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

  describe "POST #new" do
    before do
      sign_in(user)
      post :new
    end

    it "renders 200 status" do
      expect(response.status).to eq 200
    end

    it "renders :new template" do
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    def post_request(title = "Some valid content")
      post :create, params: { post: attributes_for(:post, user: user, title: title) }
    end

    before { sign_in(user) }

    describe "valid params" do
      it "creates new Post" do
        expect { post_request }.to change(Post, :count).by(1)
      end

      it "redirects" do
        post_request

        expect(response).to redirect_to post_path(Post.last)
      end
    end

    describe "invalid params" do
      it "renders :new template" do
        post_request(nil)

        expect(response).to render_template :new
      end

      it "not creates a new Post" do
        expect { post_request(nil) }.not_to change(Post, :count)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:post) { create(:post, user: user) }
    let(:another_user) { create(:user) }

    def destroy_request
      delete :destroy, params: { id: post }
    end

    describe "by Owner" do
      before { sign_in(user) }

      it "returns 302 status" do
        destroy_request

        expect(response.status).to eq 302
      end

      it "removes from DB" do
        expect { destroy_request }.to change(Post, :count).by(-1)
      end

      it "redirects to my_posts_path" do
        destroy_request

        expect(response).to redirect_to my_posts_path
      end
    end

    describe "by another user" do
      before { sign_in(another_user) }

      it "returns 302" do
        destroy_request

        expect(response.status).to eq 302
      end

      it "doesn't touch the DB" do
        expect { destroy_request }.not_to change(Post, :count)
      end

      it "redirects to somewhere" do
        destroy_request

        expect(response).to redirect_to root_path
      end
    end
  end
end
