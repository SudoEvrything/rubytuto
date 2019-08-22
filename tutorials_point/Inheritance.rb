# Inheritance, method overriding in Ruby

class Amitabh
	def initialize
		puts "This is Amitabh\'s profile"
	end
	
	def acting_super
		puts "He is very good actor"
	end
end

class Abishek < Amitabh
	def initialize
		puts "This is Abishek\'s profile"
	end
	#overriding the method of superclass
	def acting_super
		puts "I will get you role even without any acting skills"
	end
end

g = Amitabh.new
g.acting_super
abhishek_case = Abishek.new

abhishek_case.acting_super