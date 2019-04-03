require_relative '../lib/delete_n.rb'

describe 'delete nth' do
  it 'sample 1' do
    expect(delete_nth([20,37,20,21], 1)).to eq([20,37,21])
  end
  it 'sample 2' do
    expect(delete_nth([1,1,3,3,7,2,2,2,2], 3)).to eq([1, 1, 3, 3, 7, 2, 2, 2])
  end
end