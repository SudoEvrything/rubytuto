aFile = File.new("input.txt", "r+")
if aFile
	aFile.syswrite("Testing overwrite")
else
	puts "Unable to open file!"
end
puts #{aFile.open("input.txt", "r")}