def shortest_to_char(s, c)
  counts = []
  return counts if !s.include? c or c === ""
  prev_pos, next_pos = 0, 0
  dir = "next"
  current_str = s.slice(prev_pos, s.length)
  distance_next, distance_prev = current_str.index(c), nil
  s.split("").each_with_index do |char, i|
    # puts char
    if char === c
      counts.push(0)
      prev_pos, dir = i, "prev"
      current_str = s.slice(prev_pos+1, s.length)
      distance_next = 1
      next_pos = current_str.index(c)
    else
      puts "nex - #{next_pos}"
      counts.push(distance_next)
      if dir === "prev" 
        distance_next += 1
        dir = "next" if next_pos && distance_next >= (next_pos.to_f/2).round 
      else
        distance_next -= 1
      end
    end
  end
  counts
end