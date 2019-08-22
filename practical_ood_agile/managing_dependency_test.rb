load 'managing_dependency.rb'
require 'minitest/autorun'

module DiameterizableInterfaceTest
	def test_implement_the_diameterizable_interface
		assert_respond_to(@object, :diameter)
	end
end

class WheelTest < MiniTest::Unit::TestCase
	include DiameterizableInterfaceTest

	def setup
		@wheel = @object = Wheel.new(26, 1.5)
	end

	def test_calculate_diameter
		wheel = Wheel.new(26, 1.5)

		assert_in_delta(29, wheel.diameter, 0.01)
	end
end

class GearTest < MiniTest::Unit::TestCase

	def test_calculate_gear_inches
		gear = Gear.new(chainring: 52, cog: 11, wheel: Wheel.new(26, 1.5))
		assert_in_delta(137.1, gear.gear_inches, 0.01)
	end

	def setup
		@observer = MiniTest::Mock.new
		@gear = Gear.new(chainring: 52, cog: 11, observer: @observer)
	end

	def test_notifies_observers_when_cogs_change
		@observer.expect(:changed, true, [52, 27])
		@gear.set_cog(27)
		@observer.verify
	end

	def test_notifies_observers_when_chainring_change
		@observer.expect(:changed, true, [42, 11])
		@gear.set_chainring(42)
		@observer.verify
	end
end