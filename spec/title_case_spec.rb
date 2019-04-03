require_relative '../lib/title_case.rb'

describe "Basic Tests" do
  it "nothing" do
    expect(title_case('')).to eq('')
  end
  it "exclude" do
    expect(title_case('a clash of KINGS', 'a an the of')).to eq('A Clash of Kings')
  end
  it "downcase" do
    expect(title_case('THE WIND IN THE WILLOWS', 'The In')).to eq('The Wind in the Willows')
  end
  it "simple" do
    expect(title_case('the quick brown fox')).to eq('The Quick Brown Fox')
  end
end