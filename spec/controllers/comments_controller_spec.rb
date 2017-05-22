require "rails_helper"

describe CommentsController do
  let(:user) { create(:user) }
  let(:pst) { create(:post, user: user) }

  describe "#create" do
    before { sign_in(user) }

    def post_request(content = "A comment for test purposes")
      post :create, params: {
        post_id: pst,
        comment: attributes_for(:comment, content: content, user_id: user, post_id: pst)
      }
    end

    describe "with valid params" do
      it "returns 200 status" do
        post_request
        expect(response).to be_success
      end

      it "creates a record" do
        expect { post_request }.to change(Comment, :count).by(1)
      end

      it "returns correct content value" do
        post_request
        expect(response.body).not_to eq ["Content can't be blank"]
      end
    end

    describe "with invalid params" do
      it "returns 422 status" do
        post_request(nil)
        expect(response).not_to be_success
      end

      it "not creates a record" do
        expect { post_request(nil) }.not_to change(Comment, :count)
      end

      it "returns an error message" do
        post_request(nil)
        expect(JSON.parse(response.body)).to eq ["Content can't be blank"]
      end
    end
  end

  describe "#destroy" do
    let!(:comment) { create(:comment, user: user, post: pst) }

    def destroy_request
      delete :destroy, params: { post_id: pst, id: comment }
    end

    describe "successfully by Owner" do
      before { sign_in(user) }

      scenario "returns 200 status" do
        destroy_request

        expect(response.status).to eq 200
      end

      scenario "removes comment from Database" do
        expect { destroy_request }.to change(Comment, :count).by(-1)
      end

      scenario "returns object" do
        destroy_request

        expect(response.body).not_to have_content "A comment for test purposes"
      end
    end

    describe "unsuccessfully by another User" do
      let(:another_user) { create(:user) }

      before { sign_in(another_user) }

      scenario "returns 401 status" do
        destroy_request

        expect(response.status).to eq 401
      end

      scenario "returns error" do
        destroy_request

        expect(response.body).to have_content "You are not authorized to perform this action."
      end

      scenario "not removes object from DB" do
        expect { destroy_request }.to change(Comment, :count).by(0)
      end
    end
  end
end
