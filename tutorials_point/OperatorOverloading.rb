class Point2D
	attr_accessor :x, :y
	def initialize(x, y)
		@x = x
		@y = y
	end
	
	def +(second)
		Point2D.new(@x + second.x, @y + second.y)
	end
	
	def -(second)
		Point2D.new(@x - second.x, @y - second.y)
	end
	
	def *(second)
		Point2D.new(@x * second.x, @y * second.y)
	end
	
	def /(second)
		Point2D.new(@x / second.x, @y / second.y)
	end
	
	def to_s
		return "(#{@x}, #{@y})"
	end
end

p1 = Point2D.new(2, 4)
p2 = Point2D.new(3, 7)

puts p1 + p2
puts p1 - p2
puts p1 * p2
puts p1 / p2