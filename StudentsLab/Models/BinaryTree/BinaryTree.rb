require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/BinaryTree/TreeNode.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')

class BinaryTree
	include Enumerable

	attr_reader :root

	def initialize
		@root = nil
	end


	def insert(obj)
		if @root.nil?
			@root = TreeNode.new(obj)
		else
			insert_node(@root, obj)
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

  def insert_node(node, obj)
		if obj <= node.obj
			if node.left.nil?
				node.left = TreeNode.new(obj)
			else
				insert_node(node.left, obj)
			end
		else
			if node.right.nil?
				node.right = TreeNode.new(obj)
			else
				insert_node(node.right, obj)
			end
		end
	end
end