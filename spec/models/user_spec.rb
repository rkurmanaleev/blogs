require "rails_helper"
require "refile/file_double"

describe User do
  it { is_expected.to validate_presence_of :full_name }
  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :comments }

  context "avatar" do
    let(:user) { create(:user) }

    def upload_avatar(file, type)
      user.update(avatar_image: Refile::FileDouble.new("dummy", file, type))
    end

    it "allows attaching an image" do
      upload_avatar("logo.png", content_type: "image/png")

      expect(user.avatar_image_id).not_to be_nil
    end

    it "doesn't allow attaching other files" do
      upload_avatar("file.txt", content_type: "text/plain")

      expect(user.avatar_image_id).to be_nil
    end
  end
end
