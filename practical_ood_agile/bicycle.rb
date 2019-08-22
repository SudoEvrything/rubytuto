class Gear
	attr_reader :chainring, :cog, :wheel
	#specifying default using || and fetch
	def initialize(args)
		@chainring = args[:chainring] || 40
		@cog = args.fetch(:cog, 18)
		@wheel = args[:wheel]
	end

	def ratio
		chainring / cog.to_f
	end
	
	def gear_inches
		ratio * diameter
	end

	def diameter
		wheel.diameter
	end
end

class Wheel
	attr_reader :rim, :tire

	#specifying defaults by merging a defaults hash
	def initialize(args)
		args = defaults.merge(args)
		@rim = args[:rim]
		@tire = args[:tire]
	end
	
	def defaults
		{:rim => 28, :tire => 1.5}	
	end

	def diameter
		rim + (tire * 2)
	end

	def circumfernce
		diameter * Math::PI
	end
end

wheel = Wheel.new(26, 1.5)
puts wheel.circumfernce

puts Gear.new(52, 11, wheel).gear_inches

puts Gear.new(52, 11).ratio