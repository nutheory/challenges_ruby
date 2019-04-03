require 'pry'

def find_short(s)
  s.split.min_by { |w| w.length }.size    
end