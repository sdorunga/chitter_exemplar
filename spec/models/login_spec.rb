require './app/models/login'

describe Login do
  let(:user_model) { class_double(User) }
  subject(:login) { described_class.new(user_model) }
  let(:password) { "123123" }
  let(:password_digest) { BCrypt::Password.create(password) }
  let(:user) { double(:user, password_digest: password_digest, email: "user@email.com") }

  context "When user is found by email" do
    before do
      allow(user_model).to receive(:first).and_return(user)
    end

    it "authenticates a user by email and password" do
      expect(subject.user(user.email, password)).to eq user
    end

    it "does not authenticate a user when password does not match" do
      expect(subject.user(user.email, "non-matching")).to be nil
    end
  end

  context "When user is not found by email" do
    before do
      allow(user_model).to receive(:first).and_return(nil)
    end

    it "does not authenticate a user when user is not found" do
      expect(subject.user(user.email, password)).to be nil
    end
  end
end
