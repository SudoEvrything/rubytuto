require 'rubygems'
require 'sqlite3'

db = SQLite3::Database.new('sp500-data.sqlite')

db.results_as_hash = true
results = db.execute("SELECT * FROM companies where name LIKE 'C%'")

puts results[0].class

puts "#{results[0]['name']} is based in #{results[0]['city']}, #{results[0]['state']}"