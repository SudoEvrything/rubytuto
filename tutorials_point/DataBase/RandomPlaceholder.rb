require 'rubygems'
require 'sqlite3'
db = SQLite3::Database.new('sp500-data.sqlite')

LETTERS = ('A'..'Z').to_a

10.times do
	random_letters = LETTERS.shuffle.first(rand(10) + 1)
	q = random_letters.map{"name LIKE ?"}.join(' OR ')
	res = db.execute("SELECT COUNT(1) from companies WHERE #{q}", random_letters.map{|r| "#{r}%"})
	puts "There are #{res} companies with names that begins with #{random_letters.sort.join(', ')}"
end