def sort_array(source_array)
  odd = source_array.select{ |x| x.odd? }.sort
  even_with_index = {}
  source_array.each_with_index{ |n, i| even_with_index[i] = n if n.even? }
  even_with_index.each{ |k, v| 
    odd.insert(k, v)
  }
  odd
end
