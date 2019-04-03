require_relative '../lib/duplicate_encoder.rb'

describe 'duplocate encoder' do
  it 'sample 1' do
    expect(duplicate_encode("din")).to eq("(((")
  end
  it 'sample 2' do
    expect(duplicate_encode("recede")).to eq("()()()")
  end
  it 'sample 3' do
    expect(duplicate_encode("Success")).to eq(")())())")
  end
  it 'sample 4' do
    expect(duplicate_encode("(( @")).to eq("))((")
  end
end



# Test.assert_equals(duplicate_encode("din"),"(((")
# Test.assert_equals(duplicate_encode("recede"),"()()()")
# Test.assert_equals(duplicate_encode("Success"),")())())","should ignore case")
# Test.assert_equals(duplicate_encode("(( @"),"))((")