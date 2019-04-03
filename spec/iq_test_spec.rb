require_relative '../lib/iq_test.rb'

describe "Basic tests" do
  it "test 1" do
    expect(iq_test("2 4 7 8 10")).to eq(3)
  end
  it "test 2" do
    expect(iq_test("1 2 2")).to eq(1)
  end
end