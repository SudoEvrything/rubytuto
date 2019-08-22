require 'rubygems'
require 'sqlite3'


DBNAME = "hello.sqlite"
File.delete(DBNAME) if File.exists?DBNAME

DB = SQLite3::Database.new( DBNAME )
DB.execute("CREATE TABLE testdata(class_name, method_name)")

#This is the insert query we'll use for each insert statement
insert_query = "INSERT INTO testdata(class_name, method_name) VALUES(?, ?)"

[Numeric, String, Array, IO, Kernel, SQLite3, NilClass, MatchData].each do |klass|
	puts "Inserting methods for #{klass}"

	klass.methods.each do |method_name|
		DB.execute(insert_query, klass.to_s, method_name.to_s)
	end
end

q = "SELECT COUNT(1) FROM testdata"
results = DB.execute(q)
puts "\n\nThere are #{results} total entries \n"

puts "Longest method name : "
q = "SELECT * FROM testdata ORDER BY LENGTH(method_name) DESC LIMIT 20"
results = DB.execute(q)

results.each do |row|
	puts row.join('.')
end

puts "\nMost common method names :"
q = "SELECT method_name, COUNT(1) AS mcount FROM testdata GROUP BY method_name ORDER BY mcount DESC, LENGTH(method_name) DESC LIMIT 10"
results = DB.execute(q)

results.each do |row|
	puts row.join(": ")
end