require "rails_helper"

feature "As the user I would like to change my Avatar" do
  include_context "current user signed in"

  def change_avatar(folder, file)
    visit edit_user_registration_path(current_user)
    attach_file("user_avatar_image", Rails.root.join("app", "assets", folder, file))
    click_on "Update"
  end

  scenario "with the picture successfully", js: true do
    change_avatar("images", "no-avatar.png")

    expect(page).to have_content "Your account has been updated successfully."

    visit edit_user_registration_path(current_user)
    within ".user-avatar" do
      expect(find("img")["src"]).to have_content "avatar_image.jpg"
      expect(find("img")["alt"]).not_to have_content "User avatar"
    end
  end

  scenario "with non-picture unsuccesfully" do
    change_avatar("stylesheets", "application.scss")

    expect(current_path).to eq "/users"
    expect(page).to have_content "User could not be updated."
    expect(page).to have_content "has an invalid file format"
  end
end
