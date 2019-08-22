class GoodDog
	# 'attr_reader' - getter only, 'attr_writer' - setter only
	attr_accessor :name, :height, :weight

	@@number_of_dogs = 0

	def initialize(n, h, w)
		@@number_of_dogs += 1

		@name = n
		@height = h
		@weight = w
	end

	def self.total_number_of_dogs
		@@number_of_dogs		
	end

	def change_info(n, h, w)
		self.name = n
		self.height = h
		self.weight = w
	end

	def to_s
		puts "#{self.name} is #{self.height} high and weighs #{self.weight}"	
	end

	def speak
		"#{name} says arf!" # without @, calling getter method 'name', not the instance variable
	end

	def what_is_self
		self #returns calling object if it is inside instance method
	end

	puts self #referrring to the class, returns GoodDog

end

sparky = GoodDog.new("sparky", "24 Inches", "15 Kilo")
sparky.to_s
sparky.change_info("Spartacus", "28 Inches", "20 Kilo")
puts sparky

puts GoodDog.total_number_of_dogs

dog1 = GoodDog.new("Hachi", "28 Inches", "20 Kilo")
dog2 = GoodDog.new("Hugo", "28 Inches", "20 Kilo")

puts GoodDog.total_number_of_dogs

p sparky.what_is_self #returns GoodDog object sparky