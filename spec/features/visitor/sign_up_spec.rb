require "rails_helper"

feature "Sign Up" do
  let(:user_attributes) { attributes_for(:user).slice(:full_name, :email, :password, :password_confirmation) }
  let(:registered_user) { User.find_by(email: user_attributes[:email]) }

  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_in "user_full_name", with: user_attributes[:full_name]
    fill_in "user_email", with: user_attributes[:email]
    fill_in "user_password", with: user_attributes[:password]
    fill_in "user_password_confirmation", with: user_attributes[:password_confirmation]
    click_button "Sign up"

    open_email(registered_user.email)

    expect(current_email).to have_subject("Confirmation instructions")
    expect(current_email).to have_body_text(registered_user.full_name)

    visit_in_email("Confirm my account")

    expect(page).to have_content("Your email address has been successfully confirmed")
    expect(page).to have_text(registered_user.full_name)
  end
end
