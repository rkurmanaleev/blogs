require "rails_helper"

feature "I want to edit previous post title and/or content" do
  def edit_form(title)
    visit edit_post_path(post)
    fill_in "Title", with: title
    click_on "Update"
  end

  describe "as the Owner" do
    include_context "current user signed in"
    let!(:post) { create(:post, user: current_user) }

    scenario "with valid attributes" do
      edit_form("Updated title")

      expect(current_path).to eq posts_path
      expect(page).to have_content "Post has been successfully updated."
    end

    scenario "with invalid attributes from" do
      edit_form(nil)

      expect(current_path).to eq post_path(post)
      expect(page).to have_content "Titlecan't be blank"
    end
  end

  describe "as Another User" do
    let(:another_user) { create(:user) }
    let(:current_user) { build(:user) }
    let(:post) { create(:post, user: current_user) }

    before { login_as(another_user) }

    context "and failed to access it" do
      scenario "from post page" do
        visit posts_path(post)

        expect(page).not_to have_content "Edit the Post"
      end

      scenario "via direct edit link" do
        visit edit_post_path(post)

        expect(current_path).to eq root_path
      end
    end
  end
end
