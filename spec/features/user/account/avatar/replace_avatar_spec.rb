require "rails_helper"

feature "As the user I would like to change my Avatar" do
  include_context "current user signed in"
  let(:user_avatar_div) { ".user-avatar" }

  scenario "with the picture successfully", js: true do
    visit edit_user_registration_path(current_user)
    attach_file("user_avatar_image", Rails.root.join("app", "assets", "images", "no-avatar.png"))
    click_on "Update"

    expect(page).to have_content "Your account has been updated successfully."
    expect(current_path).to eq edit_user_registration_path

    within user_avatar_div do
      expect(find("img")["src"]).to have_content "avatar_image.jpg"
      expect(find("img")["alt"]).not_to have_content "User avatar"
    end
  end
end
