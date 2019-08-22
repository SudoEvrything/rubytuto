def quick_sort(array)
	return array if array.length <= 1
	pivot = array.delete_at(rand(array.length))
	
	left = Array.new
	right = Array.new

	array.each do |x|
		if x <= pivot
			left << x
		else
			right << x
		end
	end

	return *quick_sort(left), pivot, *quick_sort(right)

end

array = [11, 24, 23, 7, 12, 98, 8, 50]
a = quick_sort(array)
p a