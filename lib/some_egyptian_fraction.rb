require 'bigdecimal'

def decompose(n)
  return process_fraction((n.split "/").map { |str| str.to_i }) if n.include? "/"
  return decomp_int((n.to_f * 100000000000).to_i, []) if n.include? "."
  []
end

private

def process_fraction(n_arr)
  if n_arr[0] >= n_arr[1]
    return [(n_arr[0]/n_arr[1]).to_s] if n_arr[0].to_f % n_arr[1].to_f === 0
    whole = n_arr[0]/n_arr[1]
    rem = (n_arr[0].to_f/n_arr[1].to_f) - whole
    decomp_int((rem * 100000000000).to_i, [whole.to_s])
  else
    decomp_int(((n_arr[0].to_f/n_arr[1].to_f) * 100000000000000000).to_i, [])
  end
end

# LCM = Lowest Common Multiple
def handle_big_ints_with_lcm(s)
  lcm_multiple_count = 2
  while s[:current_acc] < s[:target_int]
    lcm = s[:lcm_arr].reduce(1, :lcm)
    lcm_multiple = (lcm * lcm_multiple_count) 
    if s[:current_acc] + s[:dividend]/lcm_multiple <= s[:target_int]
      puts "#{s[:current_acc] + s[:dividend]/lcm_multiple} ===== #{s[:target_int]}"
      # lcm_proximity = s[:target_int]/lcm_multiple 
      # puts "BOOM #{lcm_proximity}"
      s[:current_acc] += s[:dividend]/lcm_multiple
      puts "# current_acc: #{s[:current_acc]}\n++++ lcm_multiple_count: #{lcm_multiple_count}\n++++ lcm_multiple: #{lcm_multiple}\n++++ lcm: #{lcm}"
      s[:decomposed_arr].push("1/#{lcm_multiple}")
      s[:lcm_arr].push(lcm_multiple)
      s[:current_acc] = s[:target_int] if s[:target_int] - s[:current_acc] < 3
    else
      lcm_multiple_count += 1
    end
  end
  s
end

def decomp_int(target_int, decomposed_arr)
  s = initialize_state(target_int, decomposed_arr)
  divisor_count = 2
  loop do
    return s[:decomposed_arr] if s[:current_acc] === s[:target_int]
    if s[:current_acc] + s[:dividend]/divisor_count <= s[:target_int]
      s[:current_acc] += s[:dividend]/divisor_count
      s[:decomposed_arr].push("1/#{divisor_count}")
      s[:lcm_arr].push(divisor_count)
      handle_big_ints_with_lcm(s) if divisor_count > 80
    end
    divisor_count += 1
  end
end

def initialize_state(t, d)
  {
    target_int: t,
    decomposed_arr: d,
    dividend: 100000000000000000, 
    current_acc: 0,
    lcm: 0, 
    lcm_arr: []
  }
end






      # puts "IN #{n}"
      # puts "BIG #{((n_arr[0].to_f/n_arr[1].to_f) * 1000000000000).to_i}"
# puts "# LAST PASS: #{current + mod/(lcm * count)} **** #{lcm * count}"
# puts "# LAST PASS 2: #{current} **** #{target - current}"
# # lcm = lcmArr.reduce(1, :lcm)
# # lcm = lcmArr.last(2).reduce(1, :lcm)
# puts "# ?: #{current + mod/(lcm * count) === target}"
# puts "# lcm: #{lcm}"
# puts "# lcm_total: #{lcmArr}"
# puts "# ?: #{1/(lcm * 23)}"
# puts "# current_inner: #{current}"
# puts "# calc: #{mod/(lcm * 23)}"
# puts "# target: #{target}"
# puts "# current: #{current}"
# puts "# list: #{final}"
# puts "# count: #{count}"