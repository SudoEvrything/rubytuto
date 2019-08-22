class ChessBoard
	def initialize
		puts "ChessBoard initialized!"
		@chess = []
		@line = "  +"
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

	def place_mark(pos, node)
		child = Node.new(pos, node)
		node.children << child
	end

	def label_path(path)
		path[1..-1].each { |i| place_knight(i) }
		display
	end
	
	def valid?(pos)
		x, y = pos
		return (x >= 0 && x <= 7) && (y >= 0 && y <= 7)
	end

	def legal_moves(pos, node)
		x, y = pos
		moves = [ [x+2, y+1], [x+2, y-1], [x-2, y+1], [x-2, y-1], [x+1, y+2], [x-1, y-2], [x-1, y+2], [x-1, y-2] ]
		moves.each do |move|
			place_mark(move, node) if valid?(move)
		end
	end

	def bfs(start, finish)
		queue = [start]
		until queue.empty?
			current = queue.shift
			legal_moves(current.value, current)
			current.children.each do |child|
				return child if child.value == finish
				queue << child
			end
		end
	end

	def find_path(node)
		path = []
		current = node
		until current.nil?
			path.unshift(current.value)
			current = current.parent
		end
		label_path(path)
		path
	end

	def knight_moves(start, finish)
		return "Out of range" if !valid?(start) || !valid?(finish)
		return "Same position" if start == finish
		knight = Node.new(start, nil)
		place_knight(start)
		end_node = bfs(knight, finish)
		p find_path(end_node)
	end
end

class Node
	attr_accessor :value, :parent, :children

	def initialize(value = nil, parent = nil)
		@value = value
		@parent = parent
		@children = []
	end
end

chess = ChessBoard.new
puts
chess.knight_moves([0,0], [4,4])