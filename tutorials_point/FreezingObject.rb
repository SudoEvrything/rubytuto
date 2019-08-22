#Freezing object in Ruby

class Box
	def initialize(w, h)
		@width, @height = w, h
	end
	
	#accessor methods/ getters
	def getWidth
		@width
	end
	def getHeight
		@height
	end
	
	#settors methods
	def setWidth=(value)
		@width = value
	end
	def setHeight=(value)
		@height = value
	end
end

box = Box.new(10, 20)

#freezing object

box.freeze
if(box.frozen?)
	puts "Box object is frozen"
else
	puts "Box object is not frozen"
end

#try accessing frozen object attributes variables or methods

box.setWidth = 40
box.setHeight = 30

x = box.getWidth()
y = box.getHeight()

puts "Width of the box is : #{x}"
puts "Height of the box is : #{y}"