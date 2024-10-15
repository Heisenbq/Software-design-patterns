require './Student.rb'
require './Student_short.rb'

student1 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
student2 = Student.new(surname: "Gadjiev",first_name: "Akhmed",last_name: "Ruslanovich", email: "asd@mail.ru",phone: "8-960-480-74-23",  id: 2, telegram: "@valid_username",  github: "https://github.com/Heisenbq")
 puts student1 , "\n"
# puts student2
# puts student1.get_info,"\n\n"
 stud1 = Student_short.create_by_id_and_string(2,"ФИО: Gadjiev A.R. , Git: https://github.com/Heisenbq , telegram: @hysysad")
 stud2 = Student_short.create_by_student(student2)
 puts stud1
 puts stud2