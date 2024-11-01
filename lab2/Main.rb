require './Student.rb'
require './Student_short.rb'
require "./StudentBinaryTree.rb"
student1 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
student2 = Student.new(surname: "Gadjiev",first_name: "Akhmed",last_name: "Ruslanovich", email: "asd@mail.ru",phone: "8-960-480-74-23",  id: 2, telegram: "@valid_username",  github: "https://github.com/Heisenbq")
student3 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
student4 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")

student1.dob = "2002-05-06"
student2.dob = "2002-08-12"
student3.dob = "2002-01-25"
student4.dob = "2002-06-23"

tree = StudentBinaryTree.new()
tree.insert(student1)
tree.insert(student2)
tree.insert(student3)
tree.insert(student4)
tree.each {|el| puts el.student.dob}

