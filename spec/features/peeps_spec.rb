require "timecop"

feature "Peeps" do
  scenario "I can post peeps" do
    sign_in
    create_peep("OMG My cat is sooo cute! #kitty")

    expect(page).to have_content("OMG My cat is sooo cute! #kitty")
  end

  scenario "Peeps are displayed in reverse order" do
    sign_in
    create_peep("OMG My cat is sooo cute! #kitty")

    Timecop.travel(DateTime.now + 1) do
      create_peep("OMG My dog is sooo cute! #puppy")
    end

    expect(page.all(".peep .content").map(&:text)).to eq(["OMG My dog is sooo cute! #puppy", "OMG My cat is sooo cute! #kitty"])
  end

  def create_peep(message)
    visit "/"
    click_link "New peep"

    fill_in :peep, with: message
    click_button "Submit"
  end
end
