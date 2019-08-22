class Bicylce
	attr_reader :size, :parts

	def initialize(args={})
		@size = args[:size]
		@parts = args[:parts]
	end

	def spares
		parts.spares
	end
end

require 'forwardable'
class Parts extend Forwardable
	def_delegators :@parts, :size, :each
	include Enumerable

	def initialize(parts)
		@parts = parts
	end

	def spares
		select { |part| part.needs_spare  }
	end
end

=begin
#Using obstruct to create object that plays Part role
#See PartsFactory
class Part
	attr_reader :name, :description, :needs_spare

	def initialize(args)
		@name = args[:name]
		@description = args[:description]
		@needs_spare = args[:needs_spare]
	end
end 
=end

#chain = Part.new(name: 'chain', description: '10-speed', needs_spare: true)

#road_tire = Part.new(name: 'tire_size', description: '23', needs_spare: true)

#tape = Part.new(name: 'tape_color', description: 'red', needs_spare: true)

#mountain_tire = Part.new(name: 'tire_size', description: '2.1', needs_spare: true)

#rear_shock = Part.new(name: 'rear_shock', description: 'Fox', needs_spare: true)

#front_shock = Part.new(name: 'front_shock', description: 'Manitou', needs_spare: false)

#road_bike_parts = Parts.new([chain, road_tire, tape])

# road_bike = Bicylce.new(size: 'L', parts: Parts.new([chain, road_tire, tape]))
# puts road_bike.spares.size
# puts road_bike.parts.size

# mountain_bike = Bicylce.new(size: 'L', parts: Parts.new([chain, mountain_tire, front_shock, rear_shock]))
# puts mountain_bike.spares.size
# puts mountain_bike.parts.size

road_config = [['chain', '10-speed'],
								['tire_size', '23'],
								['tape_color', 'red']]
mountain_config = [['chain', '10-speed'],
										['tire_size', '2.1'],
										['front_shock', 'Manitou', false],
										['rear_shock', 'Fox']]

require 'ostruct'
module PartsFactory
	def self.build(config, parts_class = Parts)
		parts_class.new(config.collect { |part_config|
		  create_part(part_config)})
	end

	def self.create_part(part_config)
		OpenStruct.new(
			name: part_config[0],
			description: part_config[1],
			needs_spare: part_config.fetch(2, true))
	end
end

roads_parts = PartsFactory.build(road_config)
mountain_parts = PartsFactory.build(mountain_config)

road_bike = Bicylce.new(size: 'L', parts: PartsFactory.build(road_config))
road_bike.spares

mountain_bike = Bicylce.new(size: 'L', parts: mountain_parts)
mountain_bike.spares

recumbent_config = [['chain', '9-speed'], ['tire_size', '28'], ['flag', 'tall and orange']]

recumbent_bike = Bicylce.new(size: 'L', parts: PartsFactory.build(recumbent_config))