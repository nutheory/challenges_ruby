require_relative '../lib/shortest_distance.rb'

describe "Test suite" do
  it "test all" do
    expect(shortest_to_char("lovecodewars", "e")).to match_array([3, 2, 1, 0, 1, 2, 1, 0, 1, 2, 3, 4])
    expect(shortest_to_char("aaaaa", "a")).to match_array([0, 0, 0, 0, 0])
    expect(shortest_to_char("aabbaabb", "a")).to match_array([0, 0, 1, 1, 0, 0, 1, 2])
    expect(shortest_to_char("aaaabbbb", "b")).to match_array([4, 3, 2, 1, 0, 0, 0, 0])
  end
  it "test return empty" do
    expect(shortest_to_char("aaaaa", "b")).to match_array([])
    expect(shortest_to_char("lovecoding", "")).to match_array([])
    expect(shortest_to_char("", "")).to match_array([])
  end
end