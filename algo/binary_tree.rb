class Node
	attr_accessor :value, :parent, :left, :right

	def initialize(value = nil, parent = nil)
		@value = value
		@parent = nil
		@left = nil
		@right = nil
	end	
end

class BinaryTree
	attr_accessor :root

	def initialize
		@root = nil
	end

=begin 
	[5, 7, 1, 15, 9, 2, 14, 8, 7, 3]

	 				5
        /   \
       1     7
        \     \
         2     15
          \	   /  
         	3 	9
         	   / \
         	  8   14

=end

	def build_tree(array)
		@root = Node.new(array.shift)
		array.each { |value| add_node(value, @root)}
	end
	
	def add_node(value, node)
		return Node.new(value) if node.nil?

		if value >= node.value
			node.right = add_node(value, node.right)
			node.right.parent = node
		elsif value < node.value
			node.left = add_node(value, node.left)
			node.left.parent = node
		end
	end

	def breadth_first_search(value)
		queue = [@root]
		until queue.empty?
			current = queue.shift
			return current if current.value == value
			queue << current.left unless current.left.nil?
			queue << current.right unless  current.right.nil?
		end
		'nil'
	end

	def depth_first_search(value)
		stack = [@root]
		until stack.empty?
			current = stack.pop
			return current if current.value = value
			stack << current.right unless current.right.nil?
			stack << current.left unless current.left.nil?
		end
		'nil'
	end

	def dfs_rec(value, node = @root)
		return node if node.nil? || node.value = value
		puts node.value
		tmp = dfs_rec(value, node.left)
		tmp = dfs_rec(value, node.right) if tmp.nil?
		tmp
	end
end

tree = BinaryTree.new
tree.build_tree([5, 7, 1, 15, 9, 2, 14, 8, 7, 3])
puts tree.breadth_first_search(8)
puts tree.depth_first_search(14)
puts tree.dfs_rec(3)