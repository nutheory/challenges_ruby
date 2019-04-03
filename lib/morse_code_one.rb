require 'pry' 

def decodeMorse(morseCode)
  morseCode.split("   ").map { |w| w.split(" ").map { |c| MORSE_CODE[c] }.join }.join(" ").strip()
end