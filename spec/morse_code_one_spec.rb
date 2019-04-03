require_relative '../lib/morse_code_one.rb'

describe "Example from description" do
  it "decode" do
    expect(decodeMorse('.... . -.--   .--- ..- -.. .')).to eq('HEY JUDE')
  end
end

describe "Your own tests" do
# Add more tests here - it's great practice!
end