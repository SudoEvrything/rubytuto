class ChessBoard
	def initialize
		puts "ChessBoard initialized!"
		@chess = []
		@line = " +"
		8.times { @line << "---+"}
		8.times { @chess << Array.new(8){" "} }
		@turns = 0
	end

	def display
		i = 7
		puts @line
		until i < 0
			row = "#{i} |"
			8.times { |j| row << " #{@chess[i][j]} |"}
			puts row
			puts @line
			i -= 1
		end
		puts "    0   1   2   3   4   5   6   7"
	end

	def place_knight(pos)
		x, y = pos
		if @turns == 0
			@chess[x][y] = "♞"
		else
			@chess [x][y] = @turns
		end
		@turns += 1
	end
	
	
end