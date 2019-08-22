class Box
	def initialize(w, h)
		@width, @height = w, h
	end
	
	def getArea
		@width * @height
	end
end

box = Box.new(2 , 3)

a = box.getArea()
puts "Area of the box is : #{a}"