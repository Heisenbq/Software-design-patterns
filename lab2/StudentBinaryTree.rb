require "./StudentTreeNode.rb"
require "./Student.rb"

class StudentBinaryTree
	include Enumerable

	attr_reader :root

	def initialize
		@root = nil
	end


	def insert(student)
		if !student.is_a?(Student)
			raise ArgumentError, "Добавляемый узел не является Student"
		end

		if @root.nil?
			@root = StudentTreeNode.new(student)
		else
			insert_node(@root, student)
		end
	end

  def each(&block)
		dfs(@root, &block)
	end
	private

	def dfs(node, &block)
		return if node.nil?
		dfs(node.left, &block)
		yield node
		dfs(node.right, &block)
	end

  def insert_node(node, student)
		if student.dob <= node.student.dob
			if node.left.nil?
				node.left = StudentTreeNode.new(student)
			else
				insert_node(node.left, student)
			end
		else
			if node.right.nil?
				node.right = StudentTreeNode.new(student)
			else
				insert_node(node.right, student)
			end
		end
	end
end