def duplicate_encode(word)
  d = Hash.new(0)
  (word.downcase.split "").map { |l| d[l] += 1 }
  (word.downcase.split "").map { |l| d[l] > 1 ? ")" : "(" }.join("")
end