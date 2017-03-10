module SharedHelper
  def sign_in(user)
    visit new_user_registration_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Sign in"
  end
end
