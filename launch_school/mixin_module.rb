module Swimmable
	def swim
		"I can swim!"
	end
end

class Animal; end

class Fish < Animal
	include Swimmable 
end

class Mammal < Animal
	# def initialize(args)
		
	# end	
end

class Cat < Mammal
	# def initialize(args)
		
	# end
	
end

class Dog < Mammal
	include Swimmable
	# def initialize(args)
		
	# end
	
	
end

sparky = Dog.new
nemo = Fish.new
paws = Cat.new

puts sparky.swim
p nemo.swim
p paws

