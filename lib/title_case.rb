def title_case(title='', minor_words='')
  return title if title === ''
  s = title.split(' ').map{ |w|
    minor_words.downcase.split(" ").include?(w.downcase) ? w.downcase : w.capitalize 
  }.join(" ")
  s.slice(0,1).capitalize + s.slice(1..-1)
end