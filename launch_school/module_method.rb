module Mammal

	def self.some_out_place_method(num)
		num ** 2
	end	
end

value = Mammal.some_out_place_method(4) #prefer syntax
puts value
value = Mammal::some_out_place_method(2)
p value