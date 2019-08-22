module Towable
	def can_tow?(pounds)
		pounds < 2000 ? true : false
	end	
end


class Vehicle
	
	attr_accessor :color
	attr_reader :model, :year

	@@number_of_vehicles = 0

	def initialize(m, y, c)
		@@number_of_vehicles += 1
		@model = m
		@year = y
		@color = c
		@speed = 0
	end

	def self.number_of_vehicles
		puts "This program has created #{number_of_vehicles} vehicles"
	end	

	def self.gas_mileage(litres, kilometres)
		puts "#{kilometres/litres} kilometres per litres of gas"
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

	def age
		"Your #{self.model} is #{years_old} years old."
	end

	private

	def years_old
		Time.now.year - self.year
	end


end


class MyCar < Vehicle
	NUMBER_OF_DOORS = 4	
end

class MyTruck < Vehicle
	include Towable

	NUMBER_OF_DOORS = 2
end

#puts MyCar.ancestors

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
puts mercedes.age