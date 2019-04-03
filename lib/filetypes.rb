def solve(files)
  file_col = Hash.new(0)
  files.map do |str|
    last_filetype = str.slice(str.rindex("."), str.length)
    file_col[last_filetype] += 1
  end
  sorted = file_col.sort_by { |k,v| v }.reverse
  final = []
  sorted.each do |k,v|
    final.push(k) if v === sorted.first[1]
  end
  final.sort
end