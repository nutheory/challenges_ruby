require 'pry' 

def openOrSenior(data)
  data.map{ |person| person[0] >= 55 && person[1] > 7 ? "Senior" : "Open" }
end