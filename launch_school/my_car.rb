#my_car.rb

class MyCar
	attr_accessor :color
	attr_reader :model, :year

	def initialize(m, y, c)
		@model = m
		@year = y
		@color = c
		@speed = 0
	end

	def self.gas_mileage(litres, kilometres)
		puts "#{kilometres / litres} kilometres per litres of fuel"
	end

	def accelerate(speed)
		@speed += speed
	end

	def brake(speed)
		@speed -= speed
	end

	def current_speed
		puts "You are going at #{@speed} km/h"
	end

	def stop
		@speed = 0
		puts "Let's park this beast!"
	end

	def spray_paint(color)
		self.color = color		
	end

	def to_s
		puts "#{model}, #{year}, #{color}"
	end

end

mercedes = MyCar.new("Mercedes G63", 2019, "Black")
mercedes.to_s
mercedes.accelerate(176)
mercedes.current_speed
mercedes.brake(70)
mercedes.current_speed
mercedes.stop
mercedes.spray_paint("Raven")
mercedes.to_s
puts MyCar.gas_mileage(20, 169)