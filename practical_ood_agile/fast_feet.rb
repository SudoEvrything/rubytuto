load 'inheritance.rb' # Schedulable module is in inheritance.rb
class Trip
	attr_reader :bicycles, :customers, :vehicle

	def prepare(preparers)
		preparers.each { |preparer| preparer.prepare_trip(self) }
	end
end

class Mechanic

	include Schedulable

	def lead_days
		4
	end
	
	def prepare_trip(trip)
		trip.bicycles.each { |bicycle| prepare_bicycle(bicycle) }
	end
end

class TripCoordinator
	def prepare_trip(trip)
		buy_food(trip.customers)
	end
end

class Driver
	def prepare_trip(trip)
		vehicle = trip.vehicle
		gas_up(vehicle)
		fill_water_tank(vehicle)
	end
end