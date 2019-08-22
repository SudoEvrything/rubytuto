names = ['Robert', 'Joey', 'Frank', nil, 'David']

names.each do |name|
	begin
		puts "#{name}'s name has #{name.length} letters in it."
	rescue
		puts "Something went wrong!\n\n"
	end
end

#inline_exception
zero = 0
puts "Before each call"
zero.each { |element| puts element } rescue puts "Can't do that"
puts "After each call\n\n"

#rescuing pre-existing error

def divide(number, divisor)
	begin
		answer = number / divisor
	rescue ZeroDivisionError => e
		puts e.message
	end
end

puts divide(16, 4)
puts divide(4, 0)
puts divide(14, 7)