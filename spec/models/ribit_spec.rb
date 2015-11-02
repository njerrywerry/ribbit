require "rails_helper"

describe Ribit do
  it "has a valid factory" do
    expect(FactoryGirl.create(:ribit)).to be_valid
  end
  it "is invalid without content" do
    expect(FactoryGirl.build(:ribit, content: nil)).to be_invalid
  end
  it "has a length of 140 characters" do
    expect(FactoryGirl.build(:ribit, content: 140)).to be_valid
  end
end
