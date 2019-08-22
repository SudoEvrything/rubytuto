talk = Proc.new do
	puts "I am talking."
end

talk.call

speak = Proc.new { |name| puts "I\m speaking to #{name}"}

speak.call "Martin"