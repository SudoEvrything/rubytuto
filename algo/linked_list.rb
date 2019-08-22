#linked_list.rb
#Implementation of LinkedList in ruby based on
#https://www.theodinproject.com/courses/ruby-programming/lessons/linked-lists?ref=lnav

class Node
	attr_accessor :value, :next_node

	def initialize(value = nil, next_node = nil)
		@value = value
		@next_node = next_node
	end	
end

class LinkedList

	def initialize
		@head = nil
		@tail = nil
		@size = 0
	end

	def append(value)
		new_node = Node.new(value)
		@head ? @tail.next_node = new_node : @head = new_node
		@tail = new_node
		@size += 1
	end

	def prepend(value)
		new_node = Node.new(value, @head)
		@tail = new_node unless  @head
		@head = new_node
		@size += 1
	end

	def size
		@size
	end

	def head
		@head.nil? ? nil : @head.value
	end

	def tail
		@tail.nil? ? nil : @tail.value
	end

	def at(index)
		return nil if index < 0 || index > @size
		temp = @head
		index.times { temp = temp.next_node}
		temp
	end
	
	def pop
		current_node = @head
		prev_node = nil
		while current_node.next_node
			prev_node = current_node
			current_node = current_node.next_node
		end
		@tail = prev_node
		@tail.next_node = nil unless  tail.nil?
		@size -= 1
		current_node.value
	end

	def contain?(value)
		temp = @head
		while temp
			return true if temp.value == value
			temp = temp.next_node
		end
		false
	end

	def find(value)
		index = 0
		temp = @head
		while temp
			return index if temp.value == value
			index += 1
			temp = temp.next_node
		end
		nil
	end

	def to_s
		str = ''
		temp = @head
		while temp
			str << "(#{temp.value}) -> "
			temp = temp.next_node
		end
		str << 'nil'
	end

	def insert_at(data, index)
		return nil if index > @size
		return prepend(value) if index.zero?
		new_node = Node.new(data, at(index))
		at(index - 1).next_node = new_node
		@size += 1
	end

	def remove_at(index)
		return nil if index < 0 || index > @size
		index.zero? ? @head = @head.next_node : at(index - 1).next_node = at(index + 1)
		@size -= 1
	end
end

list = LinkedList.new
list.append(1)
list.append(3)
puts list.to_s

list.prepend(9)
list.prepend(2)
puts list.to_s

puts "item at (5): #{list.at(5)}"

list.pop
puts "list after pop: #{list.to_s}"

puts "list contain?(9): #{list.contain?(9)}"
puts "list contain?(12): #{list.contain?(12)}"

puts "list find(1): #{list.find(1)}"

list.insert_at(15, 3)
puts list.to_s

list.remove_at(3)
puts list.to_s