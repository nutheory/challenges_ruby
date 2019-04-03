require_relative '../lib/up_and_down.rb'

describe "arrange" do
  it "Basic tests 1" do
    expect(arrange("who hit retaining The That a we taken")).to eq("who RETAINING hit THAT a THE we TAKEN") # 3
  end
  it "Basic tests 2" do
    expect(arrange("on I came up were so grandmothers")).to eq("i CAME on WERE up GRANDMOTHERS so") # 4
    expect(arrange("way the my wall them him")).to eq("way THE my WALL him THEM") # 1
    expect(arrange("turn know great-aunts aunt look A to back")).to eq("turn GREAT-AUNTS know AUNT a LOOK to BACK") # 2
  end
end