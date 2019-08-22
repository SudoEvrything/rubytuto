puts "#{Array.new(2){|e| e = e * 2}}"
puts "#{Array.[](1, 2, 3, 4)}"
puts "#{Array[1, 2, 3] * 2}"
puts "#{Array(1..5)}\n\n"

digits = Array(0..9)
num = digits.at(6)
puts "#{num}"