require_relative '../lib/some_egyptian_fraction.rb'

describe 'test decomp' do
  it 'test 8' do 
    expect(decompose('3000/4187')).to match_array(["1/2", "1/5", "1/61", "1/9090", "1/105529529", "1/30625323994615534", "1/3751641879100695842954773901805090"]) 
  end
  # it 'test 1' do 
  #   expect(decompose('3/4')).to match_array(["1/2", "1/4"]) 
  # end
  # it 'test 2' do
  #   expect(decompose('12/4')).to match_array(["3"])
  # end
  # it 'test 0' do 
  #   expect(decompose('21/23')).to match_array(["1/2", "1/3", "1/13", "1/359", "1/644046"]) 
  # end
  # it 'test 3' do
  #   expect(decompose('75/3')).to match_array(["25"])
  # end
  # it 'test 4' do
  #   expect(decompose('4/5')).to match_array(["1/2", "1/4", "1/20"])
  # end
  # it 'test 5' do
  #   expect(decompose('0.66')).to match_array(["1/2", "1/7", "1/59", "1/5163", "1/53307975"])
  # end
  # it 'test 6' do
  #   expect(decompose('45/30')).to match_array(["1", "1/2"])
  # end
  # it 'test 7' do 
  #   expect(decompose('22/23')).to match_array(["1/2", "1/3", "1/9", "1/83", "1/34362"]) 
  # end
  # it 'test 8' do 
  #   expect(decompose('3000/4187')).to match_array(["1/2", "1/5", "1/61", "1/9090", "1/105529529", "1/30625323994615534", "1/3751641879100695842954773901805090"]) 
  # end
  # it 'test 7' do
  #   expect(decompose('50/4187')).to match_array(["1/84", "1/27055", "1/1359351420"])
  # end
end