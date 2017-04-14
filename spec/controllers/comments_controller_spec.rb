require "rails_helper"

describe CommentsController do
  let(:user) { create(:user) }
  let(:pst) { create(:post, user: user) }

  describe "#index" do
    let!(:comment) { create(:comment, user: user, post: pst) }
    let(:json_response) { JSON.parse(response.body) }

    before do
      sign_in(user)
      get :index, format: :json, params: { post_id: pst.id }
    end

    it "returns 200 status" do
      expect(response.status).to eq 200
    end

    it "lists comment" do
      expect(json_response["data"][0]["id"]).to eq comment.id.to_json
      expect(json_response["data"][0]["attributes"]["post"]).to eq comment.post_id.to_i
      expect(json_response["data"][0]["attributes"]["user"]).to eq comment.user_id.to_i
      expect(json_response["data"][0]["attributes"]["content"]).to eq comment.content
    end
  end

  describe "#create" do
    before { sign_in(user) }
    let(:json_response) { JSON.parse(response.body) }

    def post_request(valid = "A comment to test API comment#create method")
      post :create, format: :json, params:
      {
        post_id: pst.id,
        comment:
          {
            post_id: pst.id,
            user_id: user.id,
            content: valid
          }
      }
    end

    context "with valid params" do
      it "returns 200 status" do
        post_request
        expect(response).to be_success
      end

      it "creates a record" do
        expect { post_request }.to change(Comment, :count).by(1)
      end

      it "returns correct content value" do
        post_request
        expect(json_response["data"]["attributes"]["content"]).to eq "A comment to test API comment#create method"
      end
    end

    context "with invalid params" do
      it "returns 422 status" do
        post_request(nil)
        expect(response).not_to be_success
      end

      it "not creates a record" do
        expect { post_request(nil) }.not_to change(Comment, :count)
      end

      it "returns an error message" do
        post_request(nil)
        expect(json_response["content"]).to eq ["can't be blank"]
      end
    end
  end

  describe "#destroy" do
    let!(:comment) { create(:comment, user: user, post: pst) }
    let(:json_response) { JSON.parse(response.body) }

    before { sign_in(user) }

    def destroy_request
      delete :destroy, params: { id: comment, post_id: pst }
    end

    context "successfully" do
      scenario "returns 200 status" do
        destroy_request
        expect(response.status).to eq 200
      end

      scenario "removes comment from Database" do
        expect { destroy_request }.to change(Comment, :count).by(-1)
      end

      scenario "returns object" do
        destroy_request

        expect(json_response["data"]["id"]).to eq comment.id.to_json
        expect(json_response["data"]["attributes"]["post"]).to eq comment.post_id.to_i
        expect(json_response["data"]["attributes"]["user"]).to eq comment.user_id.to_i
        expect(json_response["data"]["attributes"]["content"]).to eq comment.content
      end
    end
  end
end
