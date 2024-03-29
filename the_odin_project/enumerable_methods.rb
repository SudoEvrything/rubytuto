module Enumerable
	def my_each
		for i in 0..self.length
			yield(self[i])
		end
	end

	def my_each_index
		for i in 0..self.length
			yield(self[i], i)
		end
	end

	def my_select
		result = []

		self.my_each do |e|
			result << e if yield(e)
		end
		result
	end

	def my_all?
		result = true

		self.my_each do |e|
			unless yield(e)
				result =  false
				break
			end
		end
		result
	end

	def my_any?
		result = false

		self.my_each do |e|
			if yield(e)
				result = true
				break
			end
		end
		result
	end

	def my_none?
		result = true
		
		self.my_each do |e|
			if yield(e)
				result = false
				break
			end
		end
		result
	end

	def my_count(obj=nil)
		count = 0

		if block_given?
			self.my_each do |e|
				count += 1 if yield(e)
			end
		else
			if obj
				self.my_each do |e|
					count += 1 if e == obj
				end
			else
				count =  self.length
			end
		end
		count
	end

	def my_map(proc=nil)
		result = []

		if proc
			self.my_each do |e|
				result << proc.call(e)
			end
		elsif proc.nil? && block_given?
			self.my_each do |e|
				result << yield(e)
			end			
		end
		result
	end

	def my_inject(obj=nil)
		accumulator = obj ? obj : 0

		self.my_each do |e|
			accumulator = yield(accumulator, e)
		end
		accumulator
	end

end

def multiply_els(array)
	array.my_inject(i) { |acc, e| acc * e }
end