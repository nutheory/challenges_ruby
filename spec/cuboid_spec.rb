require 'cuboid'

describe Cuboid do
 
  before :each do
    @not_intersecting = Cuboid.new(170, 100, 0, 100, 60, 160) 
    @intersecting = Cuboid.new(0, 0, 0, 100, 60, 160) 
    @cuboid = Cuboid.new(68, 34, 69, 100, 60, 160)
  end

  describe "move_to!" do
    it "changes the origin in the simple happy case" do
      expect(@cuboid.move_to!(10,0,200)[:vertices].first[:fbl]).to include(:x=>10, :y=>0, :z=>200)
    end
  end
  
  describe "rotate" do
    it "rotates cuboid 90 degrees clockwise in place" do
      expect(@cuboid.rotate).to include(:x=>88, :y=>114, :z=>69)
    end
  end
  
  describe "vertices" do
    it "returns list of vertices" do
      expect(@cuboid.vertices[:vertices].first).to have_key(:fbl)
    end
  end 

  describe "intersects?" do
    it "should intersect" do
      expect(@cuboid.intersects?(@intersecting)).to be true
    end

    it "should NOT intersect" do
      expect(@cuboid.intersects?(@not_intersecting)).to be false
    end
  end

  describe "initialization" do
    it "should fail and raise error if instantiated without proper params" do
      expect { Cuboid.new(0, 0, 100, 60, 160) }.to raise_error
    end
  end

end
