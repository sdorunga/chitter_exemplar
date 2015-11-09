feature "User management" do
  scenario "Shows a welcome message on the front page" do
    visit "/"

    expect(page).to have_content("Welcome to Chitter")
  end

  scenario "I can sign up as a user" do
    visit "/"
    click_link "Sign Up"
    fill_in :email, with: "stefan@makersacademy.com"
    fill_in :password, with: "supersecret"
    fill_in :password_confirmation, with: "supersecret"
    fill_in :name, with: "Stefan"
    fill_in :username, with: "sdorunga"

    click_button "Sign Up"

    expect(page).to have_content("Logged in as: sdorunga")
  end

  scenario "I can sign in as a user" do
    create_user

    visit "/"
    click_link "Sign In"
    fill_in :email, with: "stefan@makersacademy.com"
    fill_in :password, with: "supersecret"
    click_button "Sign In"

    expect(page).to have_content("Logged in as: sdorunga")
  end

  scenario "I can sign out" do
    sign_in

    visit "/"
    click_button "Sign Out"

    visit "/peeps/new"
    expect(page).to have_content("You must be signed in to post peeps")
  end
end
