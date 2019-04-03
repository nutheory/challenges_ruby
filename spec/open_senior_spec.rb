require_relative '../lib/open_senior.rb'

describe 'find Seniors with age atleast 55 and and handicap > 7' do
  it 'test 1' do 
    expect(openOrSenior([[45, 12],[55,21],[19, -2],[104, 20]])).to match_array(['Open', 'Senior', 'Open', 'Senior'])
  end

  it 'test 2' do 
    expect(openOrSenior([[3, 12],[55,1],[91, -2],[54, 23]])).to match_array(['Open', 'Open', 'Open', 'Open'])
  end

  it 'test 3' do 
    expect(openOrSenior([[59, 12],[55,-1],[12, -2],[12, 12]])).to match_array(['Senior', 'Open', 'Open', 'Open'])
  end

  it 'test 4' do 
    expect(openOrSenior([[16, 23],[73,1],[56, 20],[1, -1]])).to match_array(['Open', 'Open', 'Senior', 'Open'])
  end
end
