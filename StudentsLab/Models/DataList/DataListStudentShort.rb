require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/DataList/DataTable.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Models/Person/Student.rb')
class DataListStudentShort < DataList

  def get_names
    ['№', 'contact', 'github', 'surname_initials']
  end

  private  
  def get_row_of_values_of_object(student_short)
    [student_short.contact, student_short.surname_initials,student_short.github]
  end

  def check_object_type(data)
    data.all? {|elem| elem.is_a?(Student_short)} 
  end
end
# student1 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
# student2 = Student.new(surname: "Gadjiev",first_name: "Akhmed",last_name: "Ruslanovich", email: "asd@mail.ru",phone: "8-960-480-74-23",  id: 2, telegram: "@valid_username",  github: "https://github.com/Heisenbq")
# student3 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
# student4 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
# st1 = Student_short.create_by_student(student1)
# st2 = Student_short.create_by_student(student2)
# st3 = 1
# list = DataListStudentShort.new([st1,st2])
# list.select(0)
# list.select(1)
# puts list.get_data

