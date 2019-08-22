require 'rubygems'
require 'sqlite3'
db = SQLite3::Database.new('sp500-data.sqlite')
db.results_as_hash = true

inner_results = db.execute("SELECT date FROM stock_prices ORDER BY date DESC LIMIT 1")
latest_date = inner_results[0]['date']

results = db.execute("SELECT companies.*, closing_price AS latest_closing_price FROM companies INNER JOIN stock_prices ON company_id = companies.id
WHERE date = '#{latest_date}'")

results.each{|row| puts "#{row['name']}: #{row['latest_closing_price']}"}