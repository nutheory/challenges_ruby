require_relative '../lib/in_array.rb'

describe 'in_array tests' do
  it 'checks array2 for matches in array1' do
    a1 = ["arp", "live", "strong"]
    a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

    expect(in_array(a1, a2)).to match_array(["arp", "live", "strong"])
  end

  it 'matches nothing in array 2' do
    a1 = ["tarp", "mice", "bull"]
    a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

    expect(in_array(a1, a2)).to match_array([])
  end

    it 'matches nothing in array 2' do
    a1 = ["arp", "mice", "bull"]
    a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

    expect(in_array(a1, a2)).to match_array(["arp"])
  end
end
