#Factorial of a number using recursion

def factorial(num)
  if num <= 1
    return 1
  end
  num * factorial(num - 1)
end

n = gets.chomp.to_i
p factorial(n)

#   def fact
#     (2..self).reduce(1,:*)
#   end

#Do not work after '22', estimate for Real Number also
# f = Math.gamma(n+1)
# p f