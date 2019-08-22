a = [1, 2, 3]
def mutate(array)
	array.pop		#permanently delete
	array.push(7)		#add element
end

p "Before mutate method : #{a}"
mutate(a)
p "After the mutate method : #{a}"