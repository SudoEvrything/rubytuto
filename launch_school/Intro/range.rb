puts "Enter number between 0 to 100"

n = gets.chomp.to_i

def number_between(num1)
	if num1.between?(0, 50)
		puts "#{num1} is between 0 and 50"
	elsif num1.between?(51, 100)
		puts "#{num1} is between 51 and 100"
	else
		puts "It is greater than 100"
	end
end

def number_range(num1)
	case i = num1
	when 0..50
		puts "#{i} is in range of 0 and 50"
	when 51..100
		puts "#{i} is in the range of 51 and 100"
	else 
		puts "It is out of range"		
	end
end

#number_between(n)
number_range(n)