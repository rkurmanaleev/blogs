require "rails_helper"

describe PostPolicy do
  subject(:policy) { described_class }

  let(:user) { create(:user) }
  let(:another_user) { create(:user) }
  let(:post) { build(:post, user: user) }

  permissions :manage? do
    it "denies access if an user isn't owner" do
      expect(policy).not_to permit(another_user, post)
    end

    it "grants access if the user is the owner" do
      expect(policy).to permit(user, post)
    end
  end
end
