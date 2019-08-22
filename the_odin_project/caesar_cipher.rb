def caesar_cipher(text, shift)
	output = ""
	text.each_byte do |charcode|
		
		newcharcode = charcode + shift

		if charcode.between?(97, 122)
			until newcharcode.between?(97, 122)
				newcharcode -= 26
			end
			output += newcharcode.chr

		elsif charcode.between?(65, 90)
				
				until newcharcode.between?(65, 90)
					newcharcode -= 26
				end
				output += newcharcode.chr
		else
				output += charcode.chr
		end
	end
	return output
end

print caesar_cipher("A quick brown fox jumps over the lazy dog", 5)