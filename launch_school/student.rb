class Student
	attr_accessor :name

	def initialize(name, grade)
		@name = name
		@grade = grade
	end
	
	def better_grade_than?(other_student)
		grade > other_student.grade
	end

	protected

	def grade
		@grade
	end
	
end

martin = Student.new("Martin", 92)
felix = Student.new("Felix", 88)
puts "Well done!" if martin.better_grade_than?(felix)