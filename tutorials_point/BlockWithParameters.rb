def test
	yield 5
	puts "You are in the method test"
	yield 10, 12
end
test {|i, j| puts "You are in block #{i}, #{j}"}