require "rails_helper"

describe CommentPolicy do
  subject(:policy) { described_class }

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:post) { build(:post, user: user) }
  let(:comment) { build(:comment, user: user, post: post) }

  permissions :delete? do
    it "denies access if an user isn't owner" do
      expect(policy).not_to permit(another_user, comment)
    end

    it "grants access if the user is the owner" do
      expect(policy).to permit(user, comment)
    end
  end
end
