require './app/models/user'

describe User do
  let(:user) do
    User.create(email: "stefan@makersacademy.com",
                password: "supersecret",
                password_confirmation: "supersecret",
                name: "Stefan",
                username: "sdorunga")
  end

  it "authenticates a user by email and password" do
    expect(User.authenticate(user.email, user.password)).to eq user
  end

  it "doesn't authenticate a user with a wrong email" do
    expect(User.authenticate("foo@bar.com", user.password)).to be nil
  end

  it "doesn't authenticate a user with a wrong password" do
    expect(User.authenticate(user.email, "so wrong")).to be nil
  end
end
