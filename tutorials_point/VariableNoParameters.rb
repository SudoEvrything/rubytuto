def sample (*test)
	puts "The number of parameters is #{test.length}"
	for i in 0...test.length
		puts "The parameters is #{test[i]}"
	end
end
sample "Houston", "1997", "USA"
sample "Man Utd", "2008", "UCL", "EPL"