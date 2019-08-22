text = "rails are rails, really good Ruby on Rails, not railsways"

# Change "rails" to "Rails" throughout
#text.gsub!("rails", "Rails")

# Capitalize the word "Rails" throughout
text.gsub!(/\brails\b/, "Rails")
puts "#{text}"