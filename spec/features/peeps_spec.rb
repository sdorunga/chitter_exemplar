feature "Peeps" do
  scenario "I can post peeps" do
    sign_in

    click_link "New peep"

    fill_in :peep, with: "OMG My cat is sooo cute! #kitty"
    click_button "Submit"

    expect(page).to have_content("OMG My cat is sooo cute! #kitty")
  end
end
