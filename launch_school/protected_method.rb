class Animal
	def public_method
		p "Will this work? " + self.protected_method		
	end

	protected

	def protected_method
		"Yes , I'm protected!"
	end
end
fido = Animal.new
fido.public_method
=begin
fido.protected_method #NoMethodError: protected method
=end