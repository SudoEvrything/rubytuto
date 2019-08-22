require 'rubygems'
require 'sqlite3'

db = SQLite3::Database.new('sp500-data.sqlite')
companies_starting_with_c = db.execute("SELECT * FROM companies where name LIKE 'C%'")
puts companies_starting_with_c.class #returns array, iterate through them
companies_starting_with_c.each{|row| puts row.join(',')}

#each entry in the array is itself an array
puts companies_starting_with_c[2].join(',')

puts companies_starting_with_c[2][1]