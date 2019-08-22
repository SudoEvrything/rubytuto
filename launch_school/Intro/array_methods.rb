team1 = ['Raju', 'Sally']
team2 = ['Molly', 'Sita', 'Devdas']

teams = [team1, team2]

team1.push('Molly', 'Sita') #add at last index, mutate
team1.pop #remove last element, mutate
team1 << 'Sita' #same push, also mutate

team2.pop
team2.unshift('Raju', 'Sally') #add at first index, mutate

team1 == team2
teams.include?('John')

a = teams.flatten #returns 1D array
team1.sort

#team1.each_with_index {|name, index| puts "#{index+1}. #{name}"}
#team1.product(team2).each_with_index {|name, index| puts "#{index+1}. #{name}"}
#team1.each {|e| puts e}

teams.uniq #returns with duplicate element removed
#teams.uniq! #same as uniq, mutate the arguments

#Map each element and append " 's "
team1.map { | name| name.to_s + '\'s'  }