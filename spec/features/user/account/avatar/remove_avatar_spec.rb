require "rails_helper"

feature "As the user I would like to remove my Avatar" do
  include_context "current user signed in"

  scenario "with the picture successfully" do
    visit edit_user_registration_path(current_user)
    check "remove_avatar_image"
    click_on "Update"

    expect(page).to have_content "Your account has been updated successfully."
    expect(current_path).to eq edit_user_registration_path

    within ".user-avatar" do
      expect(find("img")["src"]).not_to have_content "avatar_image.jpg"
      expect(find("img")["alt"]).to have_content "No avatar"
    end
  end
end
