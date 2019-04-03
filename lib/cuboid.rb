class Cuboid
  attr_reader :pos, :area, :boundries, :rotated
  
  def initialize(x, y, z, width, height, depth)
    @pos = {x: x, y: y, z: z}
    @area = {width: width, height: height, depth: depth}
    @rotated = false
    center_of_cuboid
    draw_boundries
  end

  def move_to!(x, y, z)
    @pos = { x: x, y: y, z: z }
    center_of_cuboid
    draw_boundries
    vertices
  end
  
  # fbl = front-bottom-left, btr = back-top-right, etc.
  def vertices
    { vertices: [
      { fbl: @pos },
      { fbr: { x: @pos[:x] + @area[:width], y: @pos[:y], z: @pos[:z] }},
      { bbr: { x: @pos[:x] + @area[:width], y: @pos[:y], z: @pos[:z] + @area[:depth] }},
      { bbl: { x: @pos[:x], y: @pos[:y], z: @pos[:z] + @area[:depth] }},
      { ftl: { x: @pos[:x], y: @pos[:y] + @area[:height], z: @pos[:z] }},
      { ftr: { x: @pos[:x] + @area[:width], y: @pos[:y] + @area[:height], z: @pos[:z] }},
      { btr: { x: @pos[:x] + @area[:width], y: @pos[:y] + @area[:height], z: @pos[:z] + @area[:depth] }},
      { btl: { x: @pos[:x], y: @pos[:y] + @area[:height], z: @pos[:z] + @area[:depth] }}
    ] }
  end

  # Temp shift origin(0,0) to be the center of the cuboid before rotating 
  def rotate
    x, y = @pos[:x], @pos[:y]
    cx, cy = @center_of_cuboid[:x], @center_of_cuboid[:y]
    set_origin = { x: x-cx, y: y-cy } 
    if @rotated
      rotated = { x: set_origin[:y] * -1, y: set_origin[:x] }
    else 
      rotated = { x: set_origin[:y], y: set_origin[:x] * -1 }
    end
    @pos = { x: rotated[:x] + cx, y: rotated[:y] + cy, z: @pos[:z] }
    @rotated = !@rotated
    draw_boundries
    @pos
  end
  
  def intersects?(other)
    (@boundries[:x][0] < other.boundries[:x][1] && @boundries[:x][1] > other.boundries[:x][0]) &&
    (@boundries[:y][0] < other.boundries[:y][1] && @boundries[:y][1] > other.boundries[:y][0]) &&
    (@boundries[:z][0] < other.boundries[:z][1] && @boundries[:z][1] > other.boundries[:z][0]) ? true : false
  end

  private

  # creates conceptual boundries by connecting coords that are used 
  # for collision detection. 
  def draw_boundries
    res = {}
    vertices[:vertices].each_with_index do | vertex, i |
      vertex.each do | k, v |
        if i === 0
          res[:x], res[:y], res[:z] = [v[:x], v[:x]], [v[:y], v[:y]], [v[:z], v[:z]] 
        else
          res[:x] = [v[:x] < res[:x][0] ? v[:x] : res[:x][0], v[:x] > res[:x][1] ? v[:x] : res[:x][1]]
          res[:y] = [v[:y] < res[:y][0] ? v[:y] : res[:y][0], v[:y] > res[:y][1] ? v[:y] : res[:y][1]]
          res[:z] = [v[:z] < res[:z][0] ? v[:z] : res[:z][0], v[:z] > res[:z][1] ? v[:z] : res[:z][1]]
        end
      end
    end
    @boundries = res
  end

  def center_of_cuboid
    @center_of_cuboid = { x: @pos[:x] + (@area[:width]/2).ceil, y: @pos[:y] + (@area[:height]/2).ceil }
  end

end