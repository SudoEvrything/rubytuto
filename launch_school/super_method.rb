class Animal
	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def speak
		"Hello!"
	end	
end

class GoodDog < Animal
	def initialize(name, color)
		super(name)
		@color = color
	end

	def speak
		super + " #{self.name} says arf!" #overriding super speak method
	end	
end

class Cat < Animal
	
end

sparky = GoodDog.new("Sparky", "black")
paws = Cat.new("Spinster")

p sparky
puts paws.speak