require 'tk'

root = TkRoot.new { title "Hello, World!" } # Tk - k is lowercase
TkLabel.new(root) do	# Tk - k is lowercase
	text 'Hello, World!'
	pack {padx 15 ; pady 15; side 'left'}
end
Tk.mainloop # Tk - k is lowercase