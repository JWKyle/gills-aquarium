require 'rails_helper'

describe "Rspec is configured properly (the canary is still singing)" do
  it "sings" do
    expect(true).to eq(true)
  end
  # it "can fail" do
  #   expect(false).to eq(true)
  # end
  it "Is taking a break" do
    expect(false).to eq(false)
  end
end
