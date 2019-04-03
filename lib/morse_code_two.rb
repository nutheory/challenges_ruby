require 'pry'

MORSE_CODE = {".-"=>"A", "-..."=>"B", "-.-."=>"C", "-.."=>"D", "."=>"E", "..-."=>"F", "--."=>"G", "...."=>"H", ".."=>"I", ".---"=>"J", "-.-"=>"K", ".-.."=>"L", "--"=>"M", "-."=>"N", "---"=>"O", ".--."=>"P", "--.-"=>"Q", ".-."=>"R", "..."=>"S", "-"=>"T", "..-"=>"U", "...-"=>"V", ".--"=>"W", "-..-"=>"X", "-.--"=>"Y", "--.."=>"Z", "-----"=>"0", ".----"=>"1", "..---"=>"2", "...--"=>"3", "....-"=>"4", "....."=>"5", "-...."=>"6", "--..."=>"7", "---.."=>"8", "----."=>"9", ".-.-.-"=>".", "--..--"=>",", "..--.."=>"?", ".----."=>"'", "-.-.--"=>"!", "-..-."=>"/", "-.--."=>"(", "-.--.-"=>")", ".-..."=>"&", "---..."=>"=>", "-.-.-."=>";", "-...-"=>"=", ".-.-."=>"+", "-....-"=>"-", "..--.-"=>"_", ".-..-."=>"\"", "...-..-"=>"$", ".--.-."=>"@", "...---..."=>"SOS"}

def decodeBits(bits)
  meas = get_dots_and_spaces(bits)
  puts "1" * meas['dash']


end

def get_dots_and_spaces(bits, dots=[], spaces=[])
  if bits.start_with?("1")
    bits.index("0") ? dots.push(bits.slice(0, bits.index("0")).length) : nil
    new_bits = bits.index("0") ? bits.slice(bits.index("0"), bits.length) : ""
  else
    bits.index("0") ? spaces.push(bits.slice(0, bits.index("1")).length) : nil
    new_bits = bits.index("1") ? bits.slice(bits.index("1"), bits.length) : ""
  end
  new_bits.size > 0 ? get_dots_and_spaces(new_bits, dots, spaces) : measurements(dots,spaces)
end

def measurements(dots,spaces)
  d_d = dots.uniq.sort
  sp = spaces.uniq.sort
  { "dot" => d_d[0], "dash" => nil, "code" => sp[0],"letter" => sp[1],"word" => sp[2]}
end

# def decodeBits(bits, str=nil)
#   str ||= ""
#   bits = bits.strip
#   puts "start #{bits}"
#   new_str = case
#     when bits.start_with?("111")
#       new_bits = bits.index("0") ? bits.slice(bits.index("0"), bits.length) : ""
#       str + "-"
#     when bits.start_with?("1")
#       puts "hello #{bits} #{bits.index("0") || 0} #{bits.length || 0}"
#       new_bits = bits.index("0") ? bits.slice(bits.index("0"), bits.length) : ""
#       puts "hello new #{new_bits}"
#       str + "."
#     when bits.start_with?("0000000")
#       new_bits = bits.index("1") ? bits.slice(bits.index("1"), bits.length) : ""
#       str + "   "  
#     when bits.start_with?("000")
#       new_bits = bits.index("1") ? bits.slice(bits.index("1"), bits.length) : ""
#       str + " "
#     else
#       puts "ELSE #{bits} #{bits.index("0") || 0} #{bits.length || 0}"
#       new_bits = bits.index("1") ? bits.slice(bits.index("1"), bits.length) : ""
#       str + ""
#   end

#   puts "last #{new_bits}"
#   if new_bits.size > 0 
#     begin
#       decodeBits(new_bits, new_str)
#     rescue SystemStackError
#       puts "STACK"
#       return new_str
#     end
#   else
#     return new_str
#   end
# end

def decodeMorse(morseCode)
  morseCode.split("   ").map { |w| w.split(" ").map { |c| MORSE_CODE[c] }.join }.join(" ").strip()
end