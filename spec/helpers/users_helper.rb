module UsersHelper
  def create_user(email: "stefan@makersacademy.com", password: "supersecret")
    User.create(email: email,
      password: password,
      password_confirmation: password,
      name: "Stefan",
      username: "sdorunga")
  end

  def sign_in
    user = create_user(password: "password")
    visit "/"
    click_link "Sign In"
    fill_in :email, with: user.email
    fill_in :password, with: "password"
    click_button "Sign In"
  end
end
