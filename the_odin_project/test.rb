f = open("|dir -1 |head -3")
out = f.read
puts out

f.close

puts $?.success?