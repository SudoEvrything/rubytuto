dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def sub_string(str, dictionary)
	matchhash = Hash.new(0)
	str = str.downcase.split(" ")
	
	dictionary.each do |word|
		regex = Regexp.new(word)
		str.each { |string| matchhash[word] += 1 if string.match(word)  }
	end
	matchhash
end
#sub_string("Howdy partner, sit down! How's it going?", dictionary)

#second version using 'scan method'

def sub_string1(str, dictionary)
	results = Hash.new(0)
	words = str.downcase

	dictionary.each do |word|
		match = words.scan(word).count
		results[word] = match if match > 0
	end
	results
end

puts sub_string1("Howdy partner, sit down! How's it going?", dictionary)
