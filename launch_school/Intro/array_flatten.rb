

h = {a:1, b:2, c:3, d:4}

#puts h[:b]

h[:e] = 5
h.delete_if { |k, v| v < 3.5 }


arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |i| i.start_with?("s", "w")  }


a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']
b = a.map { |e| e.split }
b.flatten
puts b