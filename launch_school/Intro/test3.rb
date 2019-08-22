def execute(&block)
	block.call
end

execute { puts "Hello from inside the ex\n\n"}

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a.each do |i|
	if i > 5
		#puts "#{i} \n\n"
	end	
end

o = a.select { |i| i % 2 != 0 }

a << 11
a.unshift(0)
a.pop
a.push(3)
a.uniq!



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