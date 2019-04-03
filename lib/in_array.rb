require 'pry' 

def in_array(array1, array2)
  array1.select { |init_str, i| 
    array2.any? { |test_str| 
      test_str.include? init_str 
    } 
  }.sort
end


# def factorial(num)
#   # binding.pry
#   if num < 0
#     # binding.pry
#     'please put in a positive integer'
#   elsif num == 0
#     # binding.pry
#     1
#   else
#     # binding.pry
#     num * factorial(num - 1)
#   end
# end
# puts factorial(4) #=> 24

