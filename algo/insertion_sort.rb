def insertion_sort(array)
	(array.length).times do |j|
		while j > 0
			if array[j - 1] > array[j]
				array[j], array[j -1] = array[j-1], array[j]
			else
				break
			end
			j -= 1
		end
	end
	array
end

array = [11, 24, 23, 7, 12, 98, 8, 50]
insertion_sort(array)
p array