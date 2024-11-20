require File.expand_path('D:/3курс/RubyProjects/ClassModels/DataList.rb')
require File.expand_path('D:/3курс/RubyProjects/ClassModels/DataTable.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Student_short.rb')
require File.expand_path('D:/3курс/RubyProjects/StudentsLab/Student.rb')
class DataListStudentShort < DataList
  def get_names
    ['№', 'contact', 'github', 'surname_initials']
  end

  def get_data
    index = 0
    data = []

    selected = self.get_selected
    selected.each do |index|
      student_short = @data[index]
      row = [index, student_short.contact, student_short.surname_initials,student_short.github]
      data.append(row)
    end
    DataTable.new(data)
  end
end
# student1 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
# student2 = Student.new(surname: "Gadjiev",first_name: "Akhmed",last_name: "Ruslanovich", email: "asd@mail.ru",phone: "8-960-480-74-23",  id: 2, telegram: "@valid_username",  github: "https://github.com/Heisenbq")
# student3 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
# student4 = Student.new(first_name: "Akhmed",last_name: "Ruslanovich",surname: "Gadjiev", github: "https://github.com/Heisenbq")
# st1 = Student_short.create_by_student(student1)
# st2 = Student_short.create_by_student(student2)
# list = DataListStudentShort.new([st1,st2])
# list.select(0)
# list.select(1)
# puts list.get_data

