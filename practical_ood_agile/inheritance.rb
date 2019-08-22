module Schedulable
	attr_writer :schedule

	def schedule
		@schedule ||= ::Schedule.new
	end

	def schedulable?(start_date, end_date)
		!scheduled?(start_date - lead_days, end_date)
	end

	def scheduled?(start_date, end_date)
		schedule.scheduled?(self, start_date, end_date)
	end

	def lead_days
		0
	end
end


class Bicycle
	attr_reader :size, :chain, :tire_size

	include Schedulable

	def lead_days
		1
	end

	def initialize(args={})
		@size = args[:size]
		@chain = args[:chain] || default_chain
		@tire_size = args[:tire_size] || default_tire_size

		post_initialize(args)
	end

	def post_initialize(args)
		nil
	end

	def default_chain # common default
		'10-speed'
	end

	def default_tire_size
		raise NotImplementedError
					"This #{self.class} cannot respond to:"
	end

	def spares
		{ tire_size: tire_size,
			chain: chain}.merge(local_spares)
	end

	def local_spares
		{}
	end
end

class RoadBike < Bicycle
	attr_reader :tape_color

	def post_initialize(args)
		@tape_color = args[:tape_color]
	end

	def local_spares
		{tape_color: tape_color}
	end

	def default_tire_size
		'23'
	end
end

class MountainBike < Bicycle
	attr_reader :front_shock, :rear_shock

	def post_initialize(args)
		@front_shock = args[:front_shock]
		@rear_shock = args[:rear_shock]
	end

	def local_spares
		{rear_shock: rear_shock}
	end

	def default_tire_size
		'2.1'
	end
end

class RecumbentBike < Bicycle
	attr_reader :flag

	def post_initialize(args)
		@flag = args[:flag]
	end

	def local_spares
		{flag: flag}
	end

	def default_chain
		'9-speed'
	end

	def default_tire_size
		'28'
	end
end

class Schedule
	def scheduled?(schedulable, start_date, end_date)
		puts "This #{schedulable.class} " + "is not scheduled\n" +
					" between #{start_date} and #{end_date}"
		false
	end
end