class GoodDog
	# 'attr_reader' - getter only, 'attr_writer' - setter only
	attr_accessor :name, :height, :weight

	def initialize(n, h, w)
		@name = n
		@height = h
		@weight = w
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

end

sparky = GoodDog.new("sparky", "24 Inches", "15 Kilo")
sparky.to_s
sparky.change_info("Spartacus", "28 Inches", "20 Kilo")
sparky.to_s
