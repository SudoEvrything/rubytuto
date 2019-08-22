def check_in(word)
	if /lab/ =~ word
		puts word
	else
		puts "No match"
	end
end

words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
words.each { |word| check_in(word)  }