
def arrange(strng)
  s = strng.split(" ")
  b = s.each_with_index do |str, i|
    if i.even? 
      s.insert(i, s.delete_at(i+1)) if s[i+1] && s[i+1].length < str.length
    else
      s.insert(i, s.delete_at(i+1)) if s[i+1] && s[i+1].length > str.length
    end
  end
  return b.each_with_index { |str, i| i.odd? ? str.upcase! : str.downcase! }.join(" ")
end



# length s(0) <= length s(1) >= length s(2) <= length s(3) >= length (s4) <= length (s5)

# "who hit retaining The That a we taken" ---- "who RETAINING hit THAT a THE we TAKEN"  # 3
# "on I came up were so grandmothers" ---- "i CAME on WERE up GRANDMOTHERS so"  # 4
# "way the my wall them him" ---- "way THE my WALL him THEM"  # 1
# "turn know great-aunts aunt look A to back" ---- "turn GREAT-AUNTS know AUNT a LOOK to BACK"  # 2
