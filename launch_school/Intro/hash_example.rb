
person =  { 'name' => 'Kim', sex: 'F', age: '21', height: '6 ft', weight: '75 kg' }

person[:hair] = 'brown' #adding to existing
person.delete(:hair) 

person[:weight] #accsesing

#person.each { |key, value| puts "Ben's #{key} is #{value}" }

person.has_key?("hair") #returns boolean
person.has_value?("Asian")

person.select { |k,v| k == 'name' }
person.select { |k,v| (k == :age) || (v == 'F') }

person.fetch(:height)
person.fetch(:car, 'car isn\'t in the hash')

person.keys #returns all keys in array
person.values.each { |v| puts v }