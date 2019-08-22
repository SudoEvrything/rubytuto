def bubble_sort(arr)
	arr.each do
		arr.each_index do |index|
			
			next unless arr[index + 1]

			currentnum = arr[index]
			nextnum = arr[index + 1]

			if currentnum > nextnum
				arr[index] = nextnum
				arr[index + 1] = currentnum
			end
		end
	end
	p arr
end

def bubble_sort_by(array)
	array.each do
		array.each_index do |index|
			left = array[index]
			right = array[index+1]

			next unless right

			result = yield(left, right)
			if result > 0
				array[index] = right
				array[index+1] = left
			end
		end
	end
	p array
end

bubble_sort([200, 4, 3, 78, 2, 0, 2, 100])

bubble_sort_by(%w[hi hello hey welcome]) do |left, right|
  left.length <=> right.length
end