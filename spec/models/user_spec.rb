require "rails_helper"

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it "is invalid without a name"
  it "is invalid without a username"
  it "is invalid without an email"
  it "is invalid without a password"

end
