#Multiple recursion
#Collatz conjecture is the number of steps for any number to 1

def collatz(n)
	if n == 1
		0
	elsif n%2 == 0
		1 + collatz(n/2)
	elsif n%2 == 1
		1 + collatz(3 * n + 1)
	end
end

n = gets.chomp.to_i
p collatz(n)