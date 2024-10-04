require './Student.rb'

student1 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", id: 1, phone: "8 960 480 74 23", telegram: "@valid_username", email: "asd@mail.ru", github: "https://github.com/Heisenbq")
student2 = Student.new(surname: "Gadjiev",first_name: "Akhmed",last_name: "Ruslanovich", email: "asd@mail.ru",phone: "8-960-480-74-23",  id: 2, telegram: "@valid_username",  github: "https://github.com/Heisenbq")
puts student1 , "\n"
puts student2
